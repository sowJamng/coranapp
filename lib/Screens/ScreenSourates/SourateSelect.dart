import 'package:audioplayer/audioplayer.dart';
import 'package:coran/BaseDonnees/DatabaseFavories.dart';
import 'package:coran/BaseDonnees/DatabaseSourate.dart';
import 'package:coran/Model/favories/Allfavories.dart';
import 'package:coran/Model/sourates/Allsourate.dart';
import 'package:coran/Model/Lecteurs/Lecteurs.dart';
import 'package:coran/Model/Menu/MyPopupItem.dart';
import 'package:coran/Screens/Parametres/Parametres.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;

//116 and 122
typedef void OnError(Exception exception);
enum PlayerState { stopped, playing, paused }

class ChatScreen extends StatefulWidget {
  final Sourate sourate;
  final String numero;
  final numofindex;
  ChatScreen({this.sourate, this.numero, this.numofindex});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  static var posi;
  List<DropdownMenuItem<Verset>> _dropdownmenuItems;
  DatabaseHelper helper = DatabaseHelper();
  DatabaseHelperSourate helpersourate = DatabaseHelperSourate();
  Allfavories favorie;
  Verset _selectedverset;
  int selectedIndex = 0;
  Icon search = Icon(Icons.search);
  bool _searching = false;
  bool isplay = false;
  Widget titre;
  String txt;
  double _initheight;
  double _height;
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer;
  String localFilePath;
  PlayerState playerState = PlayerState.stopped;
  List<Verset> versetsearch;
  List<DropdownMenuItem<Lecteur>> _dropdownmenuItemsl;
  Lecteur _selectedlecteur;
  List<Verset> mesversets;
  ScrollController controller = ScrollController();
  String kurl = "";
  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;
  // get durationText =>
  //     duration != null ? duration.toString().split('.').first : '';
  // get positionText =>
  //     position != null ? position.toString().split('.').first : '';

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;
  MyPopupItem _select = listitemsurate[0];
  Icon favori = Icon(Icons.favorite);
  Icon addfavori = Icon(Icons.favorite_border);

  List<DropdownMenuItem<Verset>> buildDropdownItem(List versets) {
    List<DropdownMenuItem<Verset>> items = [];
    versets.forEach((verset) {
      items.add(DropdownMenuItem(value: verset, child: Text('${verset.numv}')));
    });

    return items;
  }

  onChangeVerset(Verset select) {
    setState(() {
      _selectedverset = select;
      int i = _selectedverset.numv - 1;
      //controler.jumpToIndex(7);
      //controller.animateTo(7.0, duration: Duration(milliseconds:500),curve: Curves.easeInOut);
      itemScrollController.jumpTo(index: i);
    });
  }

  List<DropdownMenuItem<Lecteur>> buildDropdownIteml(List lecteurs) {
    List<DropdownMenuItem<Lecteur>> items = [];
    lecteurs.forEach((lecteur) {
      items.add(DropdownMenuItem(
          value: lecteur, child: Text(lecteur.prenom + ' ' + lecteur.nom)));
    });
    return items;
  }

  onChangeLecteur(Lecteur select) {
    setState(() {
      _selectedlecteur = select;
      Parametres.lecteur = _selectedlecteur;
    });
  }

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    mesversets = widget.sourate.versets;
    versetsearch = mesversets;
    _dropdownmenuItemsl = buildDropdownIteml(Lecteur.meslecteurs);
    _selectedlecteur = _dropdownmenuItemsl[0].value;
    super.initState();
    this.titre = Text('');
    _initheight = 28.0;
    _height = _initheight;
    _dropdownmenuItems = buildDropdownItem(widget.sourate.versets);
    _selectedverset = _dropdownmenuItems[0].value;

    if (Parametres.lecteur.surname != "null")
      kurl = "https://www.al-hamdoulillah.com/coran/mp3/files/" +
          Parametres.lecteur.prenom +
          '-' +
          Parametres.lecteur.surname +
          '-' +
          Parametres.lecteur.nom +
          widget.numero +
          '.mp3';
    else
      kurl = "https://www.al-hamdoulillah.com/coran/mp3/files/" +
          Parametres.lecteur.prenom +
          '-' +
          Parametres.lecteur.nom +
          widget.numero +
          '.mp3';
    print(kurl);
  }

  void _saveSourate() async {
    intl_local_date_data.initializeDateFormatting();
    var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en');
    DateTime now = new DateTime.now();
    String nowFormatted = formatter.format(now);
    SourateCourante sourat =
        new SourateCourante(nowFormatted, widget.sourate.getNumero(), 0, posi);
    await helpersourate.deleteAll();
    await helpersourate.insertSourate(sourat);
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    // helper.close();
    // helpersourate.close();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() => duration = audioPlayer.duration);
      } else if (s == AudioPlayerState.STOPPED) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play(String kUrl) async {
    await audioPlayer.play(kUrl);
    // itemScrollController.jumpTo(index: i);
    setState(() {
      playerState = PlayerState.playing;
      isplay = true;
    });
  }

  Future stop(String url) async {
    await audioPlayer.stop();

    this.play(url);
    setState(() {
      //playerState = PlayerState.playing;
      isplay = true;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      playerState = PlayerState.paused;
      isplay = false;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  void _selectedItem(MyPopupItem item) {
    setState(() {
      _select = item;

      if (item == listitemsurate[0]) _height = _height + 2.0;
      if (item == listitemsurate[1]) _height = _height - 2.0;
      if (item == listitemsurate[2]) _height = _initheight;
    });
  }

  void _save(index) async {
    //favorie.date=DateFormat.yMMMd().format(DateTime.now());
    intl_local_date_data.initializeDateFormatting();
    var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en');
    DateTime now = new DateTime.now();
    String nowFormatted = formatter.format(now);
    Allfavories favor = new Allfavories();
    favor.setDate(nowFormatted);
    favor.setVarabe(widget.sourate.versets[index].getArabe());
    favor.setVwolof(widget.sourate.versets[index].getWolof());
    favor.setNumverset(widget.sourate.versets[index].getNumv());
    favor.setNomsourate(widget.sourate.getNom());
    favor.setNumsourate(widget.sourate.getNumero());
    favor.setOntap(0);
    //il faut signaler que ce verset est deja ajouté aux favori

    if (await helper.exist(favor.getNumverset(), favor.getNumsourate()) ==
        false) {
      await helper.insertFavori(favor);

      //  if(helper.insertFavori(favor)!=0)
      //  _showAletDialog('Statut', 'Verset ajouté aux favories avec succés');
      // else
      //  _showAletDialog('Statut', 'Problem d\'Ajout aux favories');
    } else
      _showSnackBar(context,
          'Verset ${favor.getNumverset()} Xas na dugg na ca Tànnef yi');
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void verification(BuildContext context, int numv, int nums, int index) async {
    if (await helper.exist(numv, nums) == false) {
      setState(() {
        addfavori = Icon(Icons.favorite);
        _save(index);
      });
    } else
      setState(() {
        addfavori = Icon(Icons.favorite_border);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // locale: Locale("ar"),

      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: this._searching == true ? titre : null,
        elevation: 2.0,
        actions: <Widget>[
          if (this._searching == false)
            DropdownButton(
              focusColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              style: TextStyle(color: Colors.black87),
              value: _selectedverset,
              items: _dropdownmenuItems,
              onChanged: (_value) => onChangeVerset(_value),
              isExpanded: false,
              hint: Text('numero Laaya', style: TextStyle(color: Colors.blue)),
              underline: Text(
                  '${widget.sourate.numero}' + '.' + widget.sourate.nom,
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                  overflow: TextOverflow.ellipsis),
            ),
          if (this._searching == false)
            IconButton(
              icon: isplay
                  ? Icon(Icons.pause_circle_outline)
                  : Icon(Icons.play_circle_outline),
              iconSize: 18.0,
              color: Colors.lightGreenAccent,
              onPressed: () => isPlaying
                  ? pause()
                  : play(kurl), //isPlaying ? null : () => play(kurl),
            ),
          IconButton(
              icon: search,
              iconSize: 17.0,
              onPressed: () {
                setState(() {
                  if (this.search.icon == Icons.search) {
                    this.search = Icon(Icons.cancel);
                    this._searching = true;
                    this.titre = TextField(
                      style: TextStyle(
                          color: Parametres.fond ? Colors.white : Colors.black,
                          fontSize: 16.0),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            color:
                                Parametres.fond ? Colors.white : Colors.black),
                      ),
                      onChanged: (text) {
                        text = text.toLowerCase();
                        setState(() {
                          versetsearch = mesversets.where((verset) {
                            return (verset.wolof.toLowerCase().contains(text) ||
                                verset.arabe.toLowerCase().contains(text));
                          }).toList();
                        });
                      },
                    );
                  } else {
                    this.search = Icon(Icons.search);
                    this._searching = false;
                    versetsearch = mesversets;
                    this.titre = Text('');
                  }
                });
              }),
          PopupMenuButton<MyPopupItem>(
              elevation: 8.0,
              initialValue: _select,
              onCanceled: () {
                print('on canceled was called');
              },
              onSelected: _selectedItem,
              color: Color(0xFF223645),
              itemBuilder: (BuildContext context) {
                return listitemsurate.map((MyPopupItem choice) {
                  return PopupMenuItem<MyPopupItem>(
                    value: choice,
                    child: choice.listTile,
                  );
                }).toList();
              })
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          setState(() {
            posi = itemPositionsListener.itemPositions.value.isNotEmpty
                ? itemPositionsListener.itemPositions.value.first.index
                : 2;
          });

          _saveSourate();
          Navigator.pop(context, false);
          //we need to return a future
          return Future.value(false);
        },
        child: Container(
          decoration: BoxDecoration(
            color: _searching ? Colors.white : Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    //   child: SafeArea(
                    // child: Scrollbar(
                    child: ScrollablePositionedList.builder(
                      initialScrollIndex: widget.numofindex,
                      addAutomaticKeepAlives: true,
                      itemPositionsListener: itemPositionsListener,
                      itemScrollController: itemScrollController,

                      itemCount:
                          versetsearch.length, //widget.sourate.versets.length,
                      itemBuilder: (BuildContext context, int index) {
                        final verset = versetsearch[
                            index]; //widget.sourate.versets[index];
                        final numero = index + 1;

                        String vr = 'https://everyayah.com/data/' +
                            Parametres.lecteur.ayabyaya +
                            widget.numero +
                            verset.numero +
                            '.mp3';
                        Intl.defaultLocale = 'ar';
                        return GestureDetector(
                          child: Card(
                            color: Parametres.fond
                                ? Color(0xFF223645)
                                : Colors.white,
                            margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                if ((widget.sourate != fatiya) &&
                                    (widget.sourate != tawbah) &&
                                    (index == 0))
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: _height,
                                        color: Colors.green,
                                        letterSpacing: 0.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                SizedBox(height: 7.0),
                                if (Sujod.withStart(
                                    widget.sourate, verset.numv))
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "۞",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: _height,
                                        fontFamily: 'noorehidayat',
                                        color: Parametres.fond
                                            ? Colors.white70
                                            : Colors.black,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 35.0, right: 3.0),
                                  padding:
                                      EdgeInsets.only(left: 35.0, right: 3.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      //'﴾${verset.numv}﴿'+'\t '+
                                      verset.arabe,
                                      //'﴾١﴿',//NumberFormat.currency(locale: 'ar').format(index),
                                      style: TextStyle(
                                        fontSize: _height,
                                        fontFamily:
                                            'mequran', //'amiriregquran',
                                        color: Parametres.fond
                                            ? Colors.white
                                            : Colors.black,
                                        letterSpacing: 0.3,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    (Sujod.withSujod(
                                            widget.sourate, verset.numv))
                                        ? '﴾${verset.numv}﴿ ۩ '
                                        : '﴾${verset.numv}﴿',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: _height,
                                      fontFamily: 'noorehidayat',
                                      color: Parametres.fond
                                          ? Colors.white70
                                          : Colors.black,
                                    ), //textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: 3.0),
                                if (Parametres.trans == true)
                                  Text(
                                    '(${verset.numv})' + ' ' + verset.francais,
                                    style: GoogleFonts.allerta(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16.0,
                                      color: Colors.green,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                if (Parametres.trans == true)
                                  SizedBox(height: 10.0),
                                if (Parametres.trad == true)
                                  Text(
                                    '${verset.numv}.' + ' ' + verset.wolof,
                                    style: GoogleFonts.allerta(
                                      fontSize: 16.0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: Colors.green,
                                        ), //isplay?Icon(Icons.pause_circle_outline,color:Colors.indigo):Icon(Icons.play_arrow,color: Colors.green,),
                                        onPressed: () {
                                          print(vr);

                                          isPlaying
                                              ? stop(vr)
                                              : play(vr); //playautomat(index);
                                        }),
                                    IconButton(
                                      icon: Icon(Icons.pause_circle_outline,
                                          color: Colors
                                              .indigo), //Color(0xFFE8582E)),
                                      onPressed:
                                          isPlaying ? () => pause() : null,
                                    ),
                                    IconButton(
                                        icon: favori,
                                        color: Colors.indigo,
                                        onPressed: () {
                                          setState(() {
                                            _save(index);
                                            _showSnackBar(context,
                                                'Verset ${verset.numv} Dugg na ca tànnef ya ak jàmm');
                                          });
                                        }),
                                    Builder(
                                      builder: (BuildContext context) {
                                        return RaisedButton(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          color: Parametres.fond
                                              ? Color(0xFF223645)
                                              : Colors.white,
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.green,
                                          ),
                                          onPressed: () => share(context,
                                              verset, widget.sourate, numero),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    //    ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void share(
      BuildContext context, Verset verset, Sourate sourate, final numero) {
    final RenderBox box = context.findRenderObject();
    txt = verset.arabe;
    final String text =
        " ( ${verset.arabe} ) \n ${verset.wolof} \n [ ${sourate.nom} : $numero ]";
    Share.share(text,
        subject: text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
