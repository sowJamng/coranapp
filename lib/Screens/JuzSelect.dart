import 'package:audioplayer/audioplayer.dart';
import 'package:coran/Model/Alljiza.dart';
import 'package:coran/Model/Allsourate.dart';
import 'package:coran/Model/MesSourates.dart';
import 'package:coran/Model/MyPopupItem.dart';
import 'package:coran/Screens/Parametres.dart';
import 'package:flutter/cupertino.dart';
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
   /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();
  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  String txt;
  double _height;
  double _initheight;
  Verset _selectedverset;
  bool _searching=false;
  bool isplay=false;
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer;
  List<DropdownMenuItem<Verset>> _dropdownmenuItems;
  String localFilePath;
  PlayerState playerState = PlayerState.stopped;
  List<Verset> mesversets;
   ScrollController controller = ScrollController();
  String kurl="";
  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;
  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';
  Duration vposition = new Duration(hours:00, minutes:00, seconds:04);
  get positionverset => "00:00:04";
  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription; 
  Widget titre;
  Icon search=Icon(Icons.search);
  List<Verset> versetsearch;
  MyPopupItem _select = listitemsurate[0];
   List<DropdownMenuItem<Verset>> buildDropdownItem(List versets) {
    List<DropdownMenuItem<Verset>> items = List();
    for (Verset verset in versets) {
      items.add(DropdownMenuItem(
          value: verset,
          child:
              Text('${verset.numv}')
              
              )
              );
    }
    return items;
  }
  onChangeVerset(Verset select) {
    setState(() {
      _selectedverset = select;
      int i=_selectedverset.numv-widget.numeroaya;
      //controler.jumpToIndex(7);
      //controller.animateTo(7.0, duration: Duration(milliseconds:500),curve: Curves.easeInOut);
      itemScrollController.jumpTo(alignment:0.0,index: i);
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
   // itemScrollController.jumpTo(index: i);
    setState(() {
      playerState = PlayerState.playing;
      isplay=true;
    });
  }
    Future playautomat(int index) async {
      
        Verset verset=versetsearch[index] ;  
        String vr='https://everyayah.com/data/'+Parametres.lecteur.ayabyaya+mesSourates[widget.ajiza.sourate.numero-1].numero+verset.numero+'.mp3';     
       print(vr);
       await audioPlayer.play(vr);
      if((position=null))
      {
           
           verset=versetsearch[index+1] ; 
           itemScrollController.jumpTo(index: index+1);
           vr='https://everyayah.com/data/'+Parametres.lecteur.ayabyaya+mesSourates[widget.ajiza.sourate.numero-1].numero+verset.numero+'.mp3';
           await audioPlayer.play(vr);   
      }  
  }
  Future stop(String url)
  async {
    await audioPlayer.stop();

    this.play(url);
    setState(() { //playerState = PlayerState.playing;
    isplay=true;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState((){
    playerState = PlayerState.paused;
    isplay=false;
    } );
  }
  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    _initheight=30.0;
    _height=_initheight;
    mesversets=widget.ajiza.beginverset;
    versetsearch=mesversets;
    titre=Text(''
          // widget.ajiza.sourate.nom,
          // style: TextStyle( fontSize: 13.0),
          // overflow: TextOverflow.clip,
          // textAlign: TextAlign.center,
        );
    _dropdownmenuItems = buildDropdownItem(widget.ajiza.beginverset);
    _selectedverset = _dropdownmenuItems[0].value;
    
    // if(Parametres.lecteur.surname!="null")
    //  kurl="https://www.al-hamdoulillah.com/coran/mp3/files/"+Parametres.lecteur.prenom+'-'+Parametres.lecteur.surname+'-'+Parametres.lecteur.nom+widget.numero+'.mp3';
    // else
    //      kurl="https://www.al-hamdoulillah.com/coran/mp3/files/"+Parametres.lecteur.prenom+'-'+Parametres.lecteur.nom+widget.numero+'.mp3';

  }
  void _selectedItem(MyPopupItem item) {
    setState(() {
      _select = item;
      if (item == listitemsurate[0])
      _height=_height+3.0;
      if (item == listitemsurate[1])
      _height=_height-2.0;
      if (item == listitemsurate[2])
      _height=_initheight;
     
    });
  }
//  _showMenu() async {
//     await showMenu(
//       position: RelativeRect.fromLTRB(100, 400, 100, 400),
//       context: context,
//       items: [
//         PopupMenuItem(
//           child: Text("InduceSmile.com"),
//         ),
//         PopupMenuItem(
//           child: Text("Flutter.io"),
//         ),
//         PopupMenuItem(
//           child: Text("Google.com"),
//         ),
//       ],
//       elevation: 5.0,
//     );
//   }
 
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: this._searching==true?titre:null,
        elevation: 1.0,
        actions: <Widget>[
           if(this._searching==false)DropdownButton(
                      focusColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down,color:Colors.white),
                      style: TextStyle(color:Colors.black87),
                      value: _selectedverset,
                      items: _dropdownmenuItems,
                      onChanged: (_value) => onChangeVerset(_value),                   
                      isExpanded: false,                     
                      hint: Text('numero verset',
                          style: TextStyle(color: Colors.blue)),
                      underline:Text('${widget.ajiza.numeroaya}'+'.'+widget.ajiza.sourate.nom,
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          overflow: TextOverflow.ellipsis,//textAlign: TextAlign.start,
                          ) ,                         
                    ),
             IconButton(icon: search, iconSize: 20.0,
          onPressed: (){
            setState(() {
              if(this.search.icon==Icons.search){
                this.search=Icon(Icons.cancel);
                this._searching=true;
                this.titre=TextField(
       style: TextStyle(color: Parametres.fond?Colors.white: Colors.black,fontSize: 16.0),
       decoration:InputDecoration(
         hintText:'Search en wolof...',
         hintStyle:TextStyle(color:Parametres.fond?Colors.white: Colors.black),
       ),
       onChanged: (text){
         text=text.toLowerCase();
         setState(() {
           versetsearch=mesversets.where((verset){      
            return (verset.wolof.toLowerCase().contains(text)||verset.arabe.toLowerCase().contains(text));
           }).toList();
        });
       },
     );

     }
     else{
       this.search=Icon(Icons.search);
       versetsearch=mesversets;
       this._searching=false;
       this.titre=Text(''
      //  this.titre=Text(
      //     widget.ajiza.sourate.nom,
      //     style: TextStyle( fontSize: 13.0),
      //     overflow: TextOverflow.clip,
      //     textAlign: TextAlign.center,
        );
     }
            });
            
          }),
           PopupMenuButton<MyPopupItem>(
                elevation: 2.0,
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
    body: GestureDetector(      
      //onLongPress:()=> _showMenu(),
          //onScaleUpdate: (ScaleUpdateDetails details){
                        
                      //         setState(() {                              
                      //           if(_nb==0){
                      //           _height=_initheight +(_initheight * (details.scale * .35));
                      //           _nb=1;
                      //           print("scale=${details.scale} height=_$_height ih=$_initheight nb=$_nb");
                      //           }
                      //           else{
                      //             _height=28.0;
                      //             _nb=0;
                      //             print("scale=${details.scale} height=_$_height ih=$_initheight nb=$_nb");
                      //           }
                      //         });
                      //       },
                      // onScaleEnd: (ScaleEndDetails details){
                      //         setState(() {
                      //           _initheight=_height;
                      //           print("height=_$_height ih=$_initheight ");
                      //           _nb=0;

                      //         });
                      //       },
                          child:Container(
        decoration: BoxDecoration(
          //color: Color(0xFFFFEFEE),
         // color: _searching?Colors.white:Colors.green,
         color: Parametres.fond?Color(0xFF223645):Colors.white,
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
      //      child:DraggableScrollbar.semicircle(
      //           labelTextBuilder: (offset) {
      //   final int currentItem = controller.hasClients ?
      //   (controller.offset / controller.position.maxScrollExtent * versetsearch.length).floor() : 0;
      //   return Text("$currentItem");
      // },
      // labelConstraints: BoxConstraints.tightFor(width: 20.0, height: 10.0),
      // controller: controller,
      // //cest por le defilement de la listview
      //               //   child: SafeArea(
      //               // child: Scrollbar(                       
      //                 child: ListView.builder(
      //                   controller:   controller,
      child: SafeArea(
                    child: Scrollbar(                       
                      child: ScrollablePositionedList.builder(
                      itemScrollController: itemScrollController,
                        
                        itemCount: versetsearch.length,//widget.ajiza.beginverset.length,
                        itemBuilder: (BuildContext context, int index) {
                          final verset  = versetsearch[index];//widget.ajiza.beginverset[index];    
                          //final numaya=index +widget.numeroaya; 
                           final vr='https://everyayah.com/data/'+Parametres.lecteur.ayabyaya+mesSourates[widget.ajiza.sourate.numero-1].numero+verset.numero+'.mp3';    
                          return Card(     
                            color: Parametres.fond? Color(0xFF223645):Colors.white,    
                            margin: EdgeInsets.only(top: 2.0, bottom: 2.0),  
                            
                          // https://www.le-coran.com/integrer-coran-site.php  return Container(
                          //   margin:
                          //   EdgeInsets.only(top: 1.0, bottom: 1.0),
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 1.0, vertical: 1.0),
                          //   decoration: BoxDecoration(
                          //     color: Parametres.fond? Color(0xFF223645):Colors.white,//Color(0xFFFFEFEE),                             
                          //     borderRadius: BorderRadius.only(
                          //       topRight: Radius.circular(0.0),
                          //       bottomRight: Radius.circular(0.0),
                          //     ),                           
                          //   ),                           
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,                              
                              children: <Widget>[    
                          SizedBox(height:7.0) ,                                       

     if(((widget.ajiza.sourate==baqara)&&((verset.numv==26)||(verset.numv==44)||(verset.numv==60)||(verset.numv==75)||(verset.numv==95)||(verset.numv==106)||(verset.numv==124)||(verset.numv==142)||(verset.numv==158)||(verset.numv==177)||(verset.numv==189)||(verset.numv==203)||(verset.numv==219)||(verset.numv==233)||(verset.numv==243)||(verset.numv==253)||(verset.numv==263)||(verset.numv==272)||(verset.numv==283)))||
    ((widget.ajiza.sourate==imran)&&((verset.numv==15)||(verset.numv==33)||(verset.numv==52)||(verset.numv==75)||(verset.numv==93)||(verset.numv==113)||(verset.numv==133)||(verset.numv==153)||(verset.numv==171)||(verset.numv==186)))||
    ((widget.ajiza.sourate==nisa)&&((verset.numv==12)||(verset.numv==24)||(verset.numv==36)||(verset.numv==58)||(verset.numv==74)||(verset.numv==88)||(verset.numv==100)||(verset.numv==114)||(verset.numv==135)||(verset.numv==148)||(verset.numv==163)))||
    ((widget.ajiza.sourate==maIda)&&((verset.numv==12)||(verset.numv==27)||(verset.numv==41)||(verset.numv==51)||(verset.numv==67)||(verset.numv==82)||(verset.numv==97)||(verset.numv==109)))||
    ((widget.ajiza.sourate==anam)&&((verset.numv==13)||(verset.numv==36)||(verset.numv==59)||(verset.numv==74)||(verset.numv==95)||(verset.numv==111)||(verset.numv==127)||(verset.numv==141)||(verset.numv==151)))||
    ((widget.ajiza.sourate==araf)&&((verset.numv==31)||(verset.numv==47)||(verset.numv==65)||(verset.numv==88)||(verset.numv==117)||(verset.numv==142)||(verset.numv==142)||(verset.numv==156)||(verset.numv==171)||(verset.numv==189)))||
    ((widget.ajiza.sourate==anfal)&&((verset.numv==22)||(verset.numv==41)||(verset.numv==61)))||
    ((widget.ajiza.sourate==tawbah)&&((verset.numv==19)||(verset.numv==34)||(verset.numv==46)||(verset.numv==60)||(verset.numv==75)||(verset.numv==93)||(verset.numv==111)||(verset.numv==122)))||
    ((widget.ajiza.sourate==yunus)&&((verset.numv==11)||(verset.numv==26)||(verset.numv==53)||(verset.numv==71)||(verset.numv==90)))||
    ((widget.ajiza.sourate==hud)&&((verset.numv==6)||(verset.numv==24)||(verset.numv==41)||(verset.numv==61)||(verset.numv==84)||(verset.numv==108)))||
    ((widget.ajiza.sourate==yussuf)&&((verset.numv==7)||(verset.numv==30)||(verset.numv==53)||(verset.numv==77)||(verset.numv==101)))||
    ((widget.ajiza.sourate==arrad)&&((verset.numv==5)||(verset.numv==5)||(verset.numv==19)||(verset.numv==35)))||
    ((widget.ajiza.sourate==ibrahim)&&((verset.numv==10)||(verset.numv==28)))||
    ((widget.ajiza.sourate==alhijr)&&(verset.numv==49))||
    ((widget.ajiza.sourate==annahl)&&((verset.numv==30)||(verset.numv==51)||(verset.numv==75)||(verset.numv==90)||(verset.numv==111)))||
    ((widget.ajiza.sourate==alisra)&&((verset.numv==23)||(verset.numv==50)||(verset.numv==70)||(verset.numv==99)))||
    ((widget.ajiza.sourate==alkahf)&&((verset.numv==32)||(verset.numv==51)||(verset.numv==75)||(verset.numv==99)||(verset.numv==17)))||
    ((widget.ajiza.sourate==maryam)&&((verset.numv==22)||(verset.numv==59)))||
    ((widget.ajiza.sourate==taha)&&((verset.numv==55)||(verset.numv==83)||(verset.numv==111)))||
    ((widget.ajiza.sourate==alanbiya)&&((verset.numv==29)||(verset.numv==51)||(verset.numv==83)))||
    ((widget.ajiza.sourate==alhadjj)&&((verset.numv==19)||(verset.numv==38)||(verset.numv==60)||(verset.numv==60)))||
    ((widget.ajiza.sourate==muminun)&&((verset.numv==36)||(verset.numv==75)))||
    ((widget.ajiza.sourate==annur)&&((verset.numv==21)||(verset.numv==35)||(verset.numv==53)))||
    ((widget.ajiza.sourate==furqan)&&((verset.numv==21)||(verset.numv==53)))||
    ((widget.ajiza.sourate==ashshura)&&((verset.numv==52)||(verset.numv==111)||(verset.numv==181)))||
    ((widget.ajiza.sourate==annaml)&&((verset.numv==27)||(verset.numv==56)||(verset.numv==82)))||
    ((widget.ajiza.sourate==alqasas)&&((verset.numv==12)||(verset.numv==29)||(verset.numv==51)||(verset.numv==76)))||
    ((widget.ajiza.sourate==ankabut)&&((verset.numv==26)||(verset.numv==46)))||
    ((widget.ajiza.sourate==arum)&&((verset.numv==31)||(verset.numv==54)))||
    ((widget.ajiza.sourate==luqman)&&((verset.numv==22)))||
    ((widget.ajiza.sourate==asajdah)&&((verset.numv==11)))||
    ((widget.ajiza.sourate==alhazab)&&((verset.numv==18)||(verset.numv==31)||(verset.numv==51)||(verset.numv==60)))||
    ((widget.ajiza.sourate==saba)&&((verset.numv==10)||(verset.numv==24)||(verset.numv==46)))||
    ((widget.ajiza.sourate==fatir)&&((verset.numv==15)||(verset.numv==41)||(verset.numv==41)))||
    ((widget.ajiza.sourate==yassin)&&((verset.numv==28)||(verset.numv==60)))||
    ((widget.ajiza.sourate==assafat)&&((verset.numv==22)||(verset.numv==83)||(verset.numv==145)))||
    ((widget.ajiza.sourate==sad)&&((verset.numv==21)||(verset.numv==52)))||
    ((widget.ajiza.sourate==azzumar)&&((verset.numv==8)||(verset.numv==32)||(verset.numv==53)))||
    ((widget.ajiza.sourate==ghafir)&&((verset.numv==21)||(verset.numv==41)||(verset.numv==66)))||
    ((widget.ajiza.sourate==fussila)&&((verset.numv==9)||(verset.numv==25)||(verset.numv==47)))||
    ((widget.ajiza.sourate==ashshura)&&((verset.numv==13)||(verset.numv==27)||(verset.numv==51)))||
    ((widget.ajiza.sourate==azukhruf)&&((verset.numv==24)||(verset.numv==57)))||
    ((widget.ajiza.sourate==addukhan)&&(verset.numv==17))||
    ((widget.ajiza.sourate==aljathiya)&&(verset.numv==12))||
    ((widget.ajiza.sourate==alahqaf)&&(verset.numv==21))||
    ((widget.ajiza.sourate==mouhamed)&&((verset.numv==10)||(verset.numv==33)))||
    ((widget.ajiza.sourate==alfath)&&(verset.numv==18))||
    ((widget.ajiza.sourate==alhujurat)&&(verset.numv==14))||
    ((widget.ajiza.sourate==qaf)&&(verset.numv==27))||
    ((widget.ajiza.sourate==adhariyat)&&(verset.numv==31))||
    ((widget.ajiza.sourate==attur)&&(verset.numv==24))||
    ((widget.ajiza.sourate==annajm)&&(verset.numv==26))||
    ((widget.ajiza.sourate==alqamar)&&(verset.numv==9))||
    ((widget.ajiza.sourate==alwaqiah)&&(verset.numv==75))||
    ((widget.ajiza.sourate==alhadid)&&(verset.numv==16))||
    ((widget.ajiza.sourate==almujadila)&&(verset.numv==14))||
    ((widget.ajiza.sourate==alhashr)&&(verset.numv==11))||
    ((widget.ajiza.sourate==almumtaHana)&&(verset.numv==7))||
    ((widget.ajiza.sourate==almunafiqun)&&(verset.numv==4))||
    ((widget.ajiza.sourate==almarij)&&(verset.numv==19))||
    ((widget.ajiza.sourate==almuzzammil)&&(verset.numv==20))||
    ((widget.ajiza.sourate==aladiyat)&&(verset.numv==9)))
      
           Align(
                  alignment: Alignment.topRight,
                  child:Text("۞",style: TextStyle(fontWeight: FontWeight.w400,
                                     fontSize: _height,
                                     fontFamily: 'noorehidayat',
                                      color:Parametres.fond? Colors.white:Colors.black,),
                  textAlign: TextAlign.right,  
                  ),
           ),
           Container(
            margin: EdgeInsets.only(left: 30.0,right: 3.0),
                            padding: EdgeInsets.only(left:30.0,right: 3.0),

             child:Align(
                               alignment: Alignment.topRight,
                               child: Text(
                                  verset.arabe ,                            
                                  style: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                     fontSize: _height,
                                       color:Parametres.fond? Colors.white:Colors.black ,
                                      letterSpacing: 0.3,
                                       fontFamily: 'mequran',
                                      ),
                                      textAlign: TextAlign.right,                                      
                                 ),    
                    ), ),  Align(
                               alignment: Alignment.bottomRight,
                                child: 
                                Text((widget.ajiza.sourate==alalaq&&verset.numv==19)||(widget.ajiza.sourate==araf&&verset.numv==206)||(widget.ajiza.sourate==arrad&&verset.numv==15)||
                               (widget.ajiza.sourate==annahl&&verset.numv==49)||(widget.ajiza.sourate==alisra&&verset.numv==109)||(widget.ajiza.sourate==maryam&&verset.numv==58)||
                               (widget.ajiza.sourate==alhadjj&&(verset.numv==18||verset.numv==77))||(widget.ajiza.sourate==furqan&&verset.numv==60)||(widget.ajiza.sourate==annaml&&verset.numv==26)||
                               (widget.ajiza.sourate==asajdah&&verset.numv==15)||(widget.ajiza.sourate==sad&&verset.numv==15)||(widget.ajiza.sourate==fussila&&verset.numv==37)||
                               (widget.ajiza.sourate==annajm&&verset.numv==62)||(widget.ajiza.sourate==inshiqaq&&verset.numv==21) ?
                               '﴾${verset.numv}﴿ ۩ ':'﴾${verset.numv}﴿',style: TextStyle(fontWeight: FontWeight.w400,
                                     fontSize: _height,
                                    fontFamily: 'noorehidayat',
                                      color: Parametres.fond? Colors.white70:Colors.black ,),//textAlign: TextAlign.right,
                                     ),
                               
                               ), 
                                SizedBox(height: 3.0),
                    if(Parametres.trans==true)
                    Text(
                                    '(${verset.numv})'+' '+verset.francais ,
                                    style:GoogleFonts.allerta(fontStyle: FontStyle.italic,fontSize: 16.0,color: Colors.green,),
                                   
                                    overflow: TextOverflow.visible,                                   
                                  ),         
                                if(Parametres.trad==true)                
                                SizedBox(height: 10.0),
                                if(Parametres.trad==true)
                                Text(
                                    '${verset.numv}.'+' '+verset.wolof ,
                                    style:GoogleFonts.allerta( fontSize: 16.0, color: Colors.deepPurpleAccent,),
                                    overflow: TextOverflow.visible,
                                  ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.play_arrow,color: Colors.green,),
                                    //onPressed: () => isplay?pause():play(vr)//isPlaying ? stop(vr):playautomat(verset.numv),
                                     onPressed:(){print(vr);
                                    isPlaying?stop(vr):play(vr);
                                    // setState(() {
                                    //   if(isplay==true){
                                    //         this.pause();
                                    //   }
                                    //   else{
                                    //     playautomat(index);
                                    //   }
                                    // });
                                   // isPlaying ? stop(vr):playautomat(index);
                                    } 
                                    ),
                                   IconButton(
                                  icon:Icon(Icons.pause_circle_outline, color:Colors.indigo),
                                  onPressed: () =>pause(),
                                    ),
                                    Builder(
                                      builder: (BuildContext context) {
                                        return RaisedButton(
                                      color:Parametres.fond? Color(0xFF223645):Colors.white,
                                          materialTapTargetSize:MaterialTapTargetSize.shrinkWrap ,
                                           child:Icon(Icons.share,color: Colors.green,
                                           ),
                                          onPressed: () =>share(context,verset,widget.ajiza.sourate,verset.numv
                                          ),
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
  void share(BuildContext context, Verset verset,Sourate sourate,final numero){
     final RenderBox box= context.findRenderObject();
     txt=verset.arabe;
     final String text= " ( ${verset.arabe} ) \n ${verset.wolof} \n [ ${sourate.nom} : $numero ]";
    Share.share(text,subject:text,sharePositionOrigin: box.localToGlobal(Offset.zero )& box.size);
   }

}