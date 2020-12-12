import 'package:coran/BaseDonnees/DatabaseFavories.dart';
import 'package:coran/Model/Allfavories.dart';
import 'package:coran/Model/MesSourates.dart';
import 'package:coran/Screens/SourateSelect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'Parametres.dart';
import 'package:coran/Model/Allsourate.dart';

class ListFavories extends StatefulWidget {
  @override
  _ListFavoriesState createState() => _ListFavoriesState();
}

class _ListFavoriesState extends State<ListFavories> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Allfavories> favorilists;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (favorilists == null) {
      favorilists = List<Allfavories>();
      updateListView();
    }
    updateListView();
    return count == 0
        ? Container(
          color: Parametres.fond ? Color(0xFF223645) : Colors.white,
          child: Center(child: Text('Aucun Favorie')))
        : Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: SafeArea(
              child: Scrollbar(
            child: ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: Parametres.fond ? Color(0xFF223645) : Colors.white,
                      child: Column(
                        children: <Widget>[
                     ListTile(
                     
                        title: Text(favorilists[index].nomsourate == null
                            ? 'nom sourate'
                            : favorilists[index]
                                .nomsourate,style:TextStyle(
                                  color:Parametres.fond ?  Colors.white:Colors.black,)
                                  ), //favorilist[index].sourate.nom favorilist[index].sourate.nb
                        subtitle: Text(
                            '${mesSourates[favorilists[index].getNumsourate() -1].lieu} - Ayat ${favorilists[index].numverset}',
                            style:TextStyle(
                                  color:Parametres.fond ?  Colors.white70:Colors.black45,)),
                        leading: GestureDetector(
                          child: CircleAvatar(
                          child: Icon(favorilists[index].getOntap()==0?Icons.keyboard_arrow_right:Icons.keyboard_arrow_up),
                          backgroundColor: Colors.green,
                          ),
                           onTap: () {
                            setState(() {
                              if(favorilists[index].getOntap()==0)
                              {favorilists[index].setOntap(1);
                              
                             _update(context,favorilists[index]);
                              }
                               else
                                  {favorilists[index].setOntap(0);
                                  _update(context,favorilists[index]);
                                  }
                            });
                            //return Text(favorilists[index].nomsourate);
                          },
                        ),
                        
                        trailing: GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          onTap: () {
                            _delete(context, favorilists[index]);
                          },
                        ),

                        onTap: () {
                          debugPrint('ListTile tapped');
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                      sourate:mesSourates[favorilists[index].getNumsourate() -1].sourate,
                                      numero:'${favorilists[index].getNumsourate()}' ),
                                ));
                          
                        },
                      ),
                     favorilists[index].getOntap()==1?
                     Column(
                       children:<Widget>[
                         if(((mesSourates[favorilists[index].getNumsourate() -1].sourate==baqara)&&((favorilists[index].getNumverset()==26)||(favorilists[index].getNumverset()==44)||(favorilists[index].getNumverset()==60)||(favorilists[index].getNumverset()==75)||(favorilists[index].getNumverset()==95)||(favorilists[index].getNumverset()==106)||(favorilists[index].getNumverset()==124)||(favorilists[index].getNumverset()==142)||(favorilists[index].getNumverset()==158)||(favorilists[index].getNumverset()==177)||(favorilists[index].getNumverset()==189)||(favorilists[index].getNumverset()==203)||(favorilists[index].getNumverset()==219)||(favorilists[index].getNumverset()==233)||(favorilists[index].getNumverset()==243)||(favorilists[index].getNumverset()==253)||(favorilists[index].getNumverset()==263)||(favorilists[index].getNumverset()==272)||(favorilists[index].getNumverset()==283)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==imran)&&((favorilists[index].getNumverset()==15)||(favorilists[index].getNumverset()==33)||(favorilists[index].getNumverset()==52)||(favorilists[index].getNumverset()==75)||(favorilists[index].getNumverset()==93)||(favorilists[index].getNumverset()==113)||(favorilists[index].getNumverset()==133)||(favorilists[index].getNumverset()==153)||(favorilists[index].getNumverset()==171)||(favorilists[index].getNumverset()==186)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==nisa)&&((favorilists[index].getNumverset()==12)||(favorilists[index].getNumverset()==24)||(favorilists[index].getNumverset()==36)||(favorilists[index].getNumverset()==58)||(favorilists[index].getNumverset()==74)||(favorilists[index].getNumverset()==88)||(favorilists[index].getNumverset()==100)||(favorilists[index].getNumverset()==114)||(favorilists[index].getNumverset()==135)||(favorilists[index].getNumverset()==148)||(favorilists[index].getNumverset()==163)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==maIda)&&((favorilists[index].getNumverset()==12)||(favorilists[index].getNumverset()==27)||(favorilists[index].getNumverset()==41)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==67)||(favorilists[index].getNumverset()==82)||(favorilists[index].getNumverset()==97)||(favorilists[index].getNumverset()==109)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==anam)&&((favorilists[index].getNumverset()==13)||(favorilists[index].getNumverset()==36)||(favorilists[index].getNumverset()==59)||(favorilists[index].getNumverset()==74)||(favorilists[index].getNumverset()==95)||(favorilists[index].getNumverset()==111)||(favorilists[index].getNumverset()==127)||(favorilists[index].getNumverset()==141)||(favorilists[index].getNumverset()==151)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==araf)&&((favorilists[index].getNumverset()==31)||(favorilists[index].getNumverset()==47)||(favorilists[index].getNumverset()==65)||(favorilists[index].getNumverset()==88)||(favorilists[index].getNumverset()==117)||(favorilists[index].getNumverset()==142)||(favorilists[index].getNumverset()==142)||(favorilists[index].getNumverset()==156)||(favorilists[index].getNumverset()==171)||(favorilists[index].getNumverset()==189)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==anfal)&&((favorilists[index].getNumverset()==22)||(favorilists[index].getNumverset()==41)||(favorilists[index].getNumverset()==61)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==tawbah)&&((favorilists[index].getNumverset()==19)||(favorilists[index].getNumverset()==34)||(favorilists[index].getNumverset()==46)||(favorilists[index].getNumverset()==60)||(favorilists[index].getNumverset()==75)||(favorilists[index].getNumverset()==93)||(favorilists[index].getNumverset()==111)||(favorilists[index].getNumverset()==122)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==yunus)&&((favorilists[index].getNumverset()==11)||(favorilists[index].getNumverset()==26)||(favorilists[index].getNumverset()==53)||(favorilists[index].getNumverset()==71)||(favorilists[index].getNumverset()==90)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==hud)&&((favorilists[index].getNumverset()==6)||(favorilists[index].getNumverset()==24)||(favorilists[index].getNumverset()==41)||(favorilists[index].getNumverset()==61)||(favorilists[index].getNumverset()==84)||(favorilists[index].getNumverset()==108)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==yussuf)&&((favorilists[index].getNumverset()==7)||(favorilists[index].getNumverset()==30)||(favorilists[index].getNumverset()==53)||(favorilists[index].getNumverset()==77)||(favorilists[index].getNumverset()==101)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==arrad)&&((favorilists[index].getNumverset()==5)||(favorilists[index].getNumverset()==5)||(favorilists[index].getNumverset()==19)||(favorilists[index].getNumverset()==35)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==ibrahim)&&((favorilists[index].getNumverset()==10)||(favorilists[index].getNumverset()==28)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhijr)&&(favorilists[index].getNumverset()==49))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==annahl)&&((favorilists[index].getNumverset()==30)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==75)||(favorilists[index].getNumverset()==90)||(favorilists[index].getNumverset()==111)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alisra)&&((favorilists[index].getNumverset()==23)||(favorilists[index].getNumverset()==50)||(favorilists[index].getNumverset()==70)||(favorilists[index].getNumverset()==99)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alkahf)&&((favorilists[index].getNumverset()==32)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==75)||(favorilists[index].getNumverset()==99)||(favorilists[index].getNumverset()==17)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==maryam)&&((favorilists[index].getNumverset()==22)||(favorilists[index].getNumverset()==59)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==taha)&&((favorilists[index].getNumverset()==55)||(favorilists[index].getNumverset()==83)||(favorilists[index].getNumverset()==111)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alanbiya)&&((favorilists[index].getNumverset()==29)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==83)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhadjj)&&((favorilists[index].getNumverset()==19)||(favorilists[index].getNumverset()==38)||(favorilists[index].getNumverset()==60)||(favorilists[index].getNumverset()==60)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==muminun)&&((favorilists[index].getNumverset()==36)||(favorilists[index].getNumverset()==75)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==annur)&&((favorilists[index].getNumverset()==21)||(favorilists[index].getNumverset()==35)||(favorilists[index].getNumverset()==53)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==furqan)&&((favorilists[index].getNumverset()==21)||(favorilists[index].getNumverset()==53)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==ashshura)&&((favorilists[index].getNumverset()==52)||(favorilists[index].getNumverset()==111)||(favorilists[index].getNumverset()==181)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==annaml)&&((favorilists[index].getNumverset()==27)||(favorilists[index].getNumverset()==56)||(favorilists[index].getNumverset()==82)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alqasas)&&((favorilists[index].getNumverset()==12)||(favorilists[index].getNumverset()==29)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==76)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==ankabut)&&((favorilists[index].getNumverset()==26)||(favorilists[index].getNumverset()==46)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==arum)&&((favorilists[index].getNumverset()==31)||(favorilists[index].getNumverset()==54)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==luqman)&&((favorilists[index].getNumverset()==22)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==asajdah)&&((favorilists[index].getNumverset()==11)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhazab)&&((favorilists[index].getNumverset()==18)||(favorilists[index].getNumverset()==31)||(favorilists[index].getNumverset()==51)||(favorilists[index].getNumverset()==60)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==saba)&&((favorilists[index].getNumverset()==10)||(favorilists[index].getNumverset()==24)||(favorilists[index].getNumverset()==46)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==fatir)&&((favorilists[index].getNumverset()==15)||(favorilists[index].getNumverset()==41)||(favorilists[index].getNumverset()==41)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==yassin)&&((favorilists[index].getNumverset()==28)||(favorilists[index].getNumverset()==60)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==assafat)&&((favorilists[index].getNumverset()==22)||(favorilists[index].getNumverset()==83)||(favorilists[index].getNumverset()==145)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==sad)&&((favorilists[index].getNumverset()==21)||(favorilists[index].getNumverset()==52)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==azzumar)&&((favorilists[index].getNumverset()==8)||(favorilists[index].getNumverset()==32)||(favorilists[index].getNumverset()==53)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==ghafir)&&((favorilists[index].getNumverset()==21)||(favorilists[index].getNumverset()==41)||(favorilists[index].getNumverset()==66)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==fussila)&&((favorilists[index].getNumverset()==9)||(favorilists[index].getNumverset()==25)||(favorilists[index].getNumverset()==47)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==ashshura)&&((favorilists[index].getNumverset()==13)||(favorilists[index].getNumverset()==27)||(favorilists[index].getNumverset()==51)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==azukhruf)&&((favorilists[index].getNumverset()==24)||(favorilists[index].getNumverset()==57)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==addukhan)&&(favorilists[index].getNumverset()==17))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==aljathiya)&&(favorilists[index].getNumverset()==12))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alahqaf)&&(favorilists[index].getNumverset()==21))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==mouhamed)&&((favorilists[index].getNumverset()==10)||(favorilists[index].getNumverset()==33)))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alfath)&&(favorilists[index].getNumverset()==18))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhujurat)&&(favorilists[index].getNumverset()==14))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==qaf)&&(favorilists[index].getNumverset()==27))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==adhariyat)&&(favorilists[index].getNumverset()==31))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==attur)&&(favorilists[index].getNumverset()==24))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==annajm)&&(favorilists[index].getNumverset()==26))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alqamar)&&(favorilists[index].getNumverset()==9))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alwaqiah)&&(favorilists[index].getNumverset()==75))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhadid)&&(favorilists[index].getNumverset()==16))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==almujadila)&&(favorilists[index].getNumverset()==14))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==alhashr)&&(favorilists[index].getNumverset()==11))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==almumtaHana)&&(favorilists[index].getNumverset()==7))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==almunafiqun)&&(favorilists[index].getNumverset()==4))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==almarij)&&(favorilists[index].getNumverset()==19))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==almuzzammil)&&(favorilists[index].getNumverset()==20))||
    ((mesSourates[favorilists[index].getNumsourate() -1].sourate==aladiyat)&&(favorilists[index].getNumverset()==9)))    
           Align(
                  alignment: Alignment.topRight,
                  child:Text("۞",style: TextStyle(fontWeight: FontWeight.w400,
                                     fontSize: 22,
                                      color: Parametres.fond? Colors.white70:Colors.black ,),
                  textAlign: TextAlign.right,  
                  ),
           ),
                        Container(
            margin: EdgeInsets.only(left: 30.0,right: 3.0),
                            padding: EdgeInsets.only(left:30.0,right: 3.0),

             child:Align(

                               alignment: Alignment.topRight,
                               child: Text(
                                  favorilists[index].getVarabe() ,                            
                                  style: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                     fontSize: 28,
                                      color:Parametres.fond?Colors.white: Colors.black ,
                                      letterSpacing: 0.3,
                                      fontFamily: 'mequran',
                                      ),
                                      textAlign: TextAlign.right,                                      
                                 ),    
                                ), 
                        ),
                                Align(
                               alignment: Alignment.topRight, 
                   child:Text( (mesSourates[favorilists[index].getNumsourate() -1].sourate==alalaq&&favorilists[index].getNumverset()==19)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==araf&&favorilists[index].getNumverset()==206)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==arrad&&favorilists[index].getNumverset()==15)||
                               (mesSourates[favorilists[index].getNumsourate() -1].sourate==annahl&&favorilists[index].getNumverset()==49)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==alisra&&favorilists[index].getNumverset()==109)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==maryam&&favorilists[index].getNumverset()==58)||
                               (mesSourates[favorilists[index].getNumsourate() -1].sourate==alhadjj&&(favorilists[index].getNumverset()==18||favorilists[index].getNumverset()==77))||(mesSourates[favorilists[index].getNumsourate() -1].sourate==furqan&&favorilists[index].getNumverset()==60)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==annaml&&favorilists[index].getNumverset()==26)||
                               (mesSourates[favorilists[index].getNumsourate() -1].sourate==asajdah&&favorilists[index].getNumverset()==15)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==sad&&favorilists[index].getNumverset()==15)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==fussila&&favorilists[index].getNumverset()==37)||
                               (mesSourates[favorilists[index].getNumsourate() -1].sourate==annajm&&favorilists[index].getNumverset()==62)||(mesSourates[favorilists[index].getNumsourate() -1].sourate==inshiqaq&&favorilists[index].getNumverset()==21)?
                                  '﴾${favorilists[index].getNumverset()}﴿ ۩ ':'﴾${favorilists[index].getNumverset()}﴿',style: TextStyle(fontWeight: FontWeight.w400,
                                     fontSize: 22,
                                     fontFamily: 'noorehidayat',
                                      color: Parametres.fond? Colors.white70:Colors.black ,),), 
                   ),               
                                //if(Parametres.trad==true)                
                                SizedBox(height: 3.0),
                               
                               if(Parametres.trans==true)
                    Text(
                                    '(${favorilists[index].getNumverset()})'+' '+'${mesSourates[favorilists[index].getNumsourate() -1].sourate.versets[favorilists[index].getNumverset()-1].francais}' ,
                                    style:GoogleFonts.allerta(fontStyle: FontStyle.italic,fontSize: 16.0,color: Colors.green,),
                                   
                                    overflow: TextOverflow.visible,                                   
                                  ),
                                 if(Parametres.trans==true) SizedBox(height: 5.0), 
                                Text(
                                    favorilists[index].getVwolof()+' '+'(${favorilists[index].getNumverset()})' ,
                                    style:GoogleFonts.allerta( fontSize: 16.0, color: Colors.deepPurpleAccent,),
                                    overflow: TextOverflow.visible,
                                  )
                       ],
                     ):Text('')
                        ],
                      ),
                  );
                  
                }),
              ),
            ),
          );
  }

  void _delete(BuildContext context, Allfavories favorie) async {
    int result = await databaseHelper.delete(favorie.id);
    if (result == 0) {
      _showSnackBar(context, 'Suppression reussie');
    }
    updateListView();
  }
  
  void _update(BuildContext context, Allfavories favorie) async {
   await databaseHelper.updateFavori(favorie);
    updateListView();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void navigateDetailFavorie(Allfavories favori, String title) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatScreen();
    }));
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Allfavories>> favorieFutureList =
          databaseHelper.getFavoriesList();
      favorieFutureList.then((favoriLists) {
        setState(() {
          this.favorilists = favoriLists;
          this.count = favoriLists.length;
        });
      });
    });
  }
}
