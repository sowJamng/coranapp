import 'package:audioplayer/audioplayer.dart';
import 'package:coran/Model/Ajiza/Alljiza.dart';
import '../../Model/sourates/Allsourate.dart';
import 'package:coran/Model/sourates/MesSourates.dart';
import 'package:coran/Model/Menu/MyPopupItem.dart';
import 'package:coran/Screens/Parametres/Parametres.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'dart:async';

typedef void OnError(Exception exception);

enum PlayerState { stopped, playing, paused }

class JusSelect extends StatefulWidget {
  final Ajiza ajiza;
  final int numeroaya;
  JusSelect({this.ajiza, this.numeroaya});

  @override
  _JusSelectState createState() => _JusSelectState();
}

class _JusSelectState extends State<JusSelect> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  String txt;
  double _height;
  double _initheight;
  Verset _selectedverset;
  bool _searching = false;
  bool isplay = false;
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer;
  List<DropdownMenuItem<Verset>> _dropdownmenuItems;
  PlayerState playerState = PlayerState.stopped;
  List<Verset> mesversets;
  ScrollController controller = ScrollController();
  String kurl = "";
  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  Duration vposition = new Duration(hours: 00, minutes: 00, seconds: 04);
  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;
  Widget titre;
  Icon search = Icon(Icons.search);
  List<Verset> versetsearch;
  MyPopupItem _select = listitemsurate[0];
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
      int i = _selectedverset.numv - widget.numeroaya;
      itemScrollController.jumpTo(alignment: 0.0, index: i);
    });
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
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

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    _initheight = 30.0;
    _height = _initheight;
    mesversets = widget.ajiza.beginverset;
    versetsearch = mesversets;
    titre = Text('');
    _dropdownmenuItems = buildDropdownItem(widget.ajiza.beginverset);
    _selectedverset = _dropdownmenuItems[0].value;
  }

  void _selectedItem(MyPopupItem item) {
    setState(() {
      _select = item;
      if (item == listitemsurate[0]) _height = _height + 3.0;
      if (item == listitemsurate[1]) _height = _height - 2.0;
      if (item == listitemsurate[2]) _height = _initheight;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: this._searching == true ? titre : null,
        elevation: 1.0,
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
              hint: Text('numero laaya', style: TextStyle(color: Colors.blue)),
              underline: Text(
                '${widget.ajiza.numeroaya}' + '.' + widget.ajiza.sourate.nom,
                style: TextStyle(color: Colors.white, fontSize: 11.0),
                overflow: TextOverflow.ellipsis, //textAlign: TextAlign.start,
              ),
            ),
          IconButton(
              icon: search,
              iconSize: 20.0,
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
                        hintText: 'Search en wolof...',
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
                    versetsearch = mesversets;
                    this._searching = false;
                    this.titre = Text('');
                  }
                });
              }),
          PopupMenuButton<MyPopupItem>(
              elevation: 2.0,
              initialValue: _select,
              onCanceled: () {},
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
      body: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
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
                    child: SafeArea(
                      child: Scrollbar(
                        child: ScrollablePositionedList.builder(
                          itemScrollController: itemScrollController,
                          itemCount: versetsearch.length,
                          itemBuilder: (BuildContext context, int index) {
                            final verset = versetsearch[index];

                            final vr = 'https://everyayah.com/data/' +
                                Parametres.lecteur.ayabyaya +
                                mesSourates[widget.ajiza.sourate.numero - 1]
                                    .numero +
                                verset.numero +
                                '.mp3';
                            return Card(
                              color: Parametres.fond
                                  ? Color(0xFF223645)
                                  : Colors.white,
                              margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 7.0),
                                  if (Sujod.withStart(
                                      widget.ajiza.sourate, verset.numv))
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "۞",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: _height,
                                          fontFamily: 'noorehidayat',
                                          color: Parametres.fond
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 30.0, right: 3.0),
                                    padding:
                                        EdgeInsets.only(left: 30.0, right: 3.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        verset.arabe,
                                        style: TextStyle(
                                          //fontWeight: FontWeight.w500,
                                          fontSize: _height,
                                          color: Parametres.fond
                                              ? Colors.white
                                              : Colors.black,
                                          letterSpacing: 0.3,
                                          fontFamily: 'mequran',
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      (Sujod.withSujod(widget.ajiza.sourate,
                                              verset.numv))
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
                                      '(${verset.numv})' +
                                          ' ' +
                                          verset.francais,
                                      style: GoogleFonts.allerta(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Colors.green,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  if (Parametres.trad == true)
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
                                          ),
                                          //onPressed: () => isplay?pause():play(vr)//isPlaying ? stop(vr):playautomat(verset.numv),
                                          onPressed: () {
                                            isPlaying ? stop(vr) : play(vr);
                                          }),
                                      IconButton(
                                        icon: Icon(Icons.pause_circle_outline,
                                            color: Colors.indigo),
                                        onPressed: () => pause(),
                                      ),
                                      Builder(
                                        builder: (BuildContext context) {
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Parametres.fond
                                                    ? Color(0xFF223645)
                                                    : Colors.white),
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.green,
                                            ),
                                            onPressed: () => share(
                                                context,
                                                verset,
                                                widget.ajiza.sourate,
                                                verset.numv),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
