import 'package:audioplayer/audioplayer.dart';
import 'package:coran/BaseDonnees/DatabaseFavories.dart';
import 'package:coran/BaseDonnees/DatabaseSourate.dart';
import 'package:coran/Model/Allfavories.dart';
import 'package:coran/Model/Allsourate.dart';
import 'package:coran/Model/Lecteurs.dart';
import 'package:coran/Model/MyPopupItem.dart';
import 'package:coran/Screens/Parametres.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;

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
  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';
  Duration vposition = new Duration(hours: 00, minutes: 00, seconds: 04);
  get positionverset => "00:00:04";
  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;
  MyPopupItem _select = listitemsurate[0];
  Icon favori = Icon(Icons.favorite);
  Icon addfavori = Icon(Icons.favorite_border);

  List<DropdownMenuItem<Verset>> buildDropdownItem(List versets) {
    List<DropdownMenuItem<Verset>> items = List();
    for (Verset verset in versets) {
      items.add(DropdownMenuItem(value: verset, child: Text('${verset.numv}')));
    }
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
    List<DropdownMenuItem<Lecteur>> items = List();
    for (Lecteur lecteur in lecteurs) {
      items.add(DropdownMenuItem(
          value: lecteur, child: Text(lecteur.prenom + ' ' + lecteur.nom)));
    }
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
    // ChatScreen.sourateread=widget.sourate;
    //Parametres.continuesourate=widget.sourate;
    //Parametres.num=widget.numero;

    //  _saveSourate();
  }

  void _saveSourate() async {
    intl_local_date_data.initializeDateFormatting();
    var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en');
    DateTime now = new DateTime.now();
    String nowFormatted = formatter.format(now);
    SourateCourante sourat = new SourateCourante();
    sourat.setDate(nowFormatted);
    sourat.setNumsourate(widget.sourate.getNumero());
    sourat.setOntap(0);
    sourat.setNumverset(posi);
    await helpersourate.deleteAll();
    await helpersourate.insertSourate(sourat);
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
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

  Future playautomat(int index) async {
    Verset verset = versetsearch[index];
    String vr = 'https://everyayah.com/data/' +
        Parametres.lecteur.ayabyaya +
        widget.numero +
        verset.numero +
        '.mp3';
    await audioPlayer.play(vr);
    if ((position = null)) {
      verset = versetsearch[index + 1];
      itemScrollController.jumpTo(index: index + 1);
      vr = 'https://everyayah.com/data/' +
          Parametres.lecteur.ayabyaya +
          widget.numero +
          verset.numero +
          '.mp3';
      await audioPlayer.play(vr);
    }
  }
  // Future _playLocal() async {
  //   await audioPlayer.play(localFilePath, isLocal: true);
  //   setState(() => playerState = PlayerState.playing);
  // }

  // itemScrollController. scrollTo (
  // indice :  150 ,
  // durée :  Durée (secondes :  2 ),
  // courbe :  courbes .easeInOutCubic);https://github.com/google/flutter.widgets/tree/master/packages/scrollable_positioned_list
  //https://pub.dev/packages/scrollable_positioned_list#-example-tab-
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
    //https://sqliteonline.com/
    //  favor.setSourate(widget.sourate);
    favor.setDate(nowFormatted);
    favor.setVarabe(widget.sourate.versets[index].arabe);
    favor.setVwolof(widget.sourate.versets[index].wolof);
    favor.setNumverset(widget.sourate.versets[index].numv);
    favor.setNomsourate(widget.sourate.nom);
    favor.setNumsourate(widget.sourate.getNumero());
    favor.setOntap(0);
    // mes cours videos https://web.microsoftstream.com/group/2636dad7-18bb-4361-a790-be5309f4819b?view=videos
    //  favor.setVerset(widget.sourate.versets[index]);
    //favorie.date=nowFormatted;
    //if(favori.verset!=null) il faut signaler que ce verset est deja ajouté aux favori

    if (await helper.exist(favor.getNumverset(), favor.getNumsourate()) ==
        false) {
      await helper.insertFavori(favor);

      //  if(helper.insertFavori(favor)!=0)
      //  _showAletDialog('Statut', 'Verset ajouté aux favories avec succés');
      // else
      //  _showAletDialog('Statut', 'Problem d\'Ajout aux favories');
    } else
      _showSnackBar(
          context, 'Verset ${favor.getNumverset()} déjà ajouté aux favories');
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
              hint: Text('numero verset', style: TextStyle(color: Colors.blue)),
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
              //  if (duration != null)
              //   Slider(
              //   value: position?.inMilliseconds?.toDouble() ?? 0.0,
              //   onChanged: (double value) {
              //     return audioPlayer.seek((value / 1000).roundToDouble());
              //   },
              //   activeColor: Color(0xFF223645),
              //   min: 0.0,
              //   max: duration.inMilliseconds.toDouble()
              //   ),
              //if (position != null) _buildProgressView(),
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
                        //context.locale=Locale('ar');
                        //var format = NumberFormat().format(numero);
                        return GestureDetector(
                          //cetait pour lautre metode dajout aux favorie
                          // onLongPress:()=> _showMenu(index),
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
                                        //backgroundColor: Color(0xFFFFEFEE),
                                        letterSpacing: 0.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                SizedBox(height: 7.0),
                                //  if(((widget.sourate==baqara)&&((verset.numv==26)||(verset.numv==44)||(verset.numv==60)||(verset.numv==75)||(verset.numv==95)||(verset.numv==106)||(verset.numv==124)||(verset.numv==142)||(verset.numv==158)||(verset.numv==177)||(verset.numv==189)||(verset.numv==203)||(verset.numv==219)||(verset.numv==233)||(verset.numv==243)||(verset.numv==253)||(verset.numv==263)||(verset.numv==272)||(verset.numv==283)))||
                                // ((widget.sourate==imran)&&((verset.numv==15)||(verset.numv==33)||(verset.numv==52)||(verset.numv==75)||(verset.numv==93)||(verset.numv==113)||(verset.numv==133)||(verset.numv==153)||(verset.numv==171)||(verset.numv==186)))||
                                // ((widget.sourate==nisa)&&((verset.numv==12)||(verset.numv==24)||(verset.numv==36)||(verset.numv==58)||(verset.numv==74)||(verset.numv==88)||(verset.numv==100)||(verset.numv==114)||(verset.numv==135)||(verset.numv==148)||(verset.numv==163)))||
                                // ((widget.sourate==maIda)&&((verset.numv==12)||(verset.numv==27)||(verset.numv==41)||(verset.numv==51)||(verset.numv==67)||(verset.numv==82)||(verset.numv==97)||(verset.numv==109)))||
                                // ((widget.sourate==anam)&&((verset.numv==13)||(verset.numv==36)||(verset.numv==59)||(verset.numv==74)||(verset.numv==95)||(verset.numv==111)||(verset.numv==127)||(verset.numv==141)||(verset.numv==151)))||
                                // ((widget.sourate==araf)&&((verset.numv==31)||(verset.numv==47)||(verset.numv==65)||(verset.numv==88)||(verset.numv==117)||(verset.numv==142)||(verset.numv==142)||(verset.numv==156)||(verset.numv==171)||(verset.numv==189)))||
                                // ((widget.sourate==anfal)&&((verset.numv==22)||(verset.numv==41)||(verset.numv==61)))||
                                // ((widget.sourate==tawbah)&&((verset.numv==19)||(verset.numv==34)||(verset.numv==46)||(verset.numv==60)||(verset.numv==75)||(verset.numv==93)||(verset.numv==111)||(verset.numv==122)))||
                                // ((widget.sourate==yunus)&&((verset.numv==11)||(verset.numv==26)||(verset.numv==53)||(verset.numv==71)||(verset.numv==90)))||
                                // ((widget.sourate==hud)&&((verset.numv==6)||(verset.numv==24)||(verset.numv==41)||(verset.numv==61)||(verset.numv==84)||(verset.numv==108)))||
                                // ((widget.sourate==yussuf)&&((verset.numv==7)||(verset.numv==30)||(verset.numv==53)||(verset.numv==77)||(verset.numv==101)))||
                                // ((widget.sourate==arrad)&&((verset.numv==5)||(verset.numv==5)||(verset.numv==19)||(verset.numv==35)))||
                                // ((widget.sourate==ibrahim)&&((verset.numv==10)||(verset.numv==28)))||
                                // ((widget.sourate==alhijr)&&(verset.numv==49))||
                                // ((widget.sourate==annahl)&&((verset.numv==30)||(verset.numv==51)||(verset.numv==75)||(verset.numv==90)||(verset.numv==111)))||
                                // ((widget.sourate==alisra)&&((verset.numv==23)||(verset.numv==50)||(verset.numv==70)||(verset.numv==99)))||
                                // ((widget.sourate==alkahf)&&((verset.numv==32)||(verset.numv==51)||(verset.numv==75)||(verset.numv==99)||(verset.numv==17)))||
                                // ((widget.sourate==maryam)&&((verset.numv==22)||(verset.numv==59)))||
                                // ((widget.sourate==taha)&&((verset.numv==55)||(verset.numv==83)||(verset.numv==111)))||
                                // ((widget.sourate==alanbiya)&&((verset.numv==29)||(verset.numv==51)||(verset.numv==83)))||
                                // ((widget.sourate==alhadjj)&&((verset.numv==19)||(verset.numv==38)||(verset.numv==60)||(verset.numv==60)))||
                                // ((widget.sourate==muminun)&&((verset.numv==36)||(verset.numv==75)))||
                                // ((widget.sourate==annur)&&((verset.numv==21)||(verset.numv==35)||(verset.numv==53)))||
                                // ((widget.sourate==furqan)&&((verset.numv==21)||(verset.numv==53)))||
                                // ((widget.sourate==ashshura)&&((verset.numv==52)||(verset.numv==111)||(verset.numv==181)))||
                                // ((widget.sourate==annaml)&&((verset.numv==27)||(verset.numv==56)||(verset.numv==82)))||
                                // ((widget.sourate==alqasas)&&((verset.numv==12)||(verset.numv==29)||(verset.numv==51)||(verset.numv==76)))||
                                // ((widget.sourate==ankabut)&&((verset.numv==26)||(verset.numv==46)))||
                                // ((widget.sourate==arum)&&((verset.numv==31)||(verset.numv==54)))||
                                // ((widget.sourate==luqman)&&((verset.numv==22)))||
                                // ((widget.sourate==asajdah)&&((verset.numv==11)))||
                                // ((widget.sourate==alhazab)&&((verset.numv==18)||(verset.numv==31)||(verset.numv==51)||(verset.numv==60)))||
                                // ((widget.sourate==saba)&&((verset.numv==10)||(verset.numv==24)||(verset.numv==46)))||
                                // ((widget.sourate==fatir)&&((verset.numv==15)||(verset.numv==41)||(verset.numv==41)))||
                                // ((widget.sourate==yassin)&&((verset.numv==28)||(verset.numv==60)))||
                                // ((widget.sourate==assafat)&&((verset.numv==22)||(verset.numv==83)||(verset.numv==145)))||
                                // ((widget.sourate==sad)&&((verset.numv==21)||(verset.numv==52)))||
                                // ((widget.sourate==azzumar)&&((verset.numv==8)||(verset.numv==32)||(verset.numv==53)))||
                                // ((widget.sourate==ghafir)&&((verset.numv==21)||(verset.numv==41)||(verset.numv==66)))||
                                // ((widget.sourate==fussila)&&((verset.numv==9)||(verset.numv==25)||(verset.numv==47)))||
                                // ((widget.sourate==ashshura)&&((verset.numv==13)||(verset.numv==27)||(verset.numv==51)))||
                                // ((widget.sourate==azukhruf)&&((verset.numv==24)||(verset.numv==57)))||
                                // ((widget.sourate==addukhan)&&(verset.numv==17))||
                                // ((widget.sourate==aljathiya)&&(verset.numv==12))||
                                // ((widget.sourate==alahqaf)&&(verset.numv==21))||
                                // ((widget.sourate==mouhamed)&&((verset.numv==10)||(verset.numv==33)))||
                                // ((widget.sourate==alfath)&&(verset.numv==18))||
                                // ((widget.sourate==alhujurat)&&(verset.numv==14))||
                                // ((widget.sourate==qaf)&&(verset.numv==27))||
                                // ((widget.sourate==adhariyat)&&(verset.numv==31))||
                                // ((widget.sourate==attur)&&(verset.numv==24))||
                                // ((widget.sourate==annajm)&&(verset.numv==26))||
                                // ((widget.sourate==alqamar)&&(verset.numv==9))||
                                // ((widget.sourate==alwaqiah)&&(verset.numv==75))||
                                // ((widget.sourate==alhadid)&&(verset.numv==16))||
                                // ((widget.sourate==almujadila)&&(verset.numv==14))||
                                // ((widget.sourate==alhashr)&&(verset.numv==11))||
                                // ((widget.sourate==almumtaHana)&&(verset.numv==7))||
                                // ((widget.sourate==almunafiqun)&&(verset.numv==4))||
                                // ((widget.sourate==almarij)&&(verset.numv==19))||
                                // ((widget.sourate==almuzzammil)&&(verset.numv==20))||
                                // ((widget.sourate==aladiyat)&&(verset.numv==9)))
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
                                    //     ),
                                    // TextStyle(
                                    //     fontWeight: FontWeight.w400,
                                    //     fontSize: 17.0,
                                    //     color: Colors.green,
                                    //  ),
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
                                    // style: TextStyle(
                                    //     fontWeight: FontWeight.w600,
                                    //     fontSize: 17.0,
                                    //     color: Colors.deepPurpleAccent,//Parametres.fond? Colors.white70:Colors.black,//Colors.green,
                                    //  ),
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
                                          //isplay?pause():play(vr);
                                          // setState(() {
                                          //   if(isplay==true){
                                          //         this.pause();
                                          //   }
                                          //   else{
                                          //     playautomat(index);
                                          //   }
                                          // });
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
                                                'Verset ${verset.numv} ajouté aux favories avec succés');
                                          });

                                          // setState(() {
                                          //   if(addfavori.icon==Icons.favorite_border)
                                          //   {this.addfavori=Icon(Icons.favorite);
                                          //   _save(index);
                                          //    _showSnackBar(context, 'Verset ajouté aux favories avec succés');
                                          //   }
                                          //   else
                                          //   this.addfavori= Icon(Icons.favorite_border);
                                          // });
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

  int comparePosition() {
    if ((position != null) && (position.inSeconds <= 04)) {
      return 0;
    }
    return 1;
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
