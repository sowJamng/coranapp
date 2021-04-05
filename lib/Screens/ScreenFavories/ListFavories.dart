import 'package:coran/BaseDonnees/DatabaseFavories.dart';
import 'package:coran/Model/favories/Allfavories.dart';
import 'package:coran/Model/sourates/MesSourates.dart';
import 'package:coran/Screens/Screensourates/SourateSelect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import '../Parametres/Parametres.dart';
import 'package:coran/Model/sourates/Allsourate.dart';

class ListFavories extends StatefulWidget {
  @override
  _ListFavoriesState createState() => _ListFavoriesState();
}

class _ListFavoriesState extends State<ListFavories> {
  @override
  void dispose() {
    // databaseHelper.close();
    super.dispose();
  }

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Allfavories> favorilists;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (favorilists == null) {
      favorilists = <Allfavories>[];
      updateListView();
    }
    updateListView();
    return count == 0
        ? Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: Center(child: Text('Amul Tànneef')))
        : Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: SafeArea(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color:
                            Parametres.fond ? Color(0xFF223645) : Colors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                  favorilists[index].getNomSourate().length < 1
                                      ? 'Saar wi'
                                      : favorilists[index].nomsourate,
                                  style: TextStyle(
                                    color: Parametres.fond
                                        ? Colors.white
                                        : Colors.black,
                                  )), //favorilist[index].sourate.nom favorilist[index].sourate.nb
                              subtitle: Text(
                                  '${mesSourates[favorilists[index].getNumsourate() - 1].lieu} - Laaya ${favorilists[index].numverset}',
                                  style: TextStyle(
                                    color: Parametres.fond
                                        ? Colors.white70
                                        : Colors.black45,
                                  )),
                              leading: GestureDetector(
                                child: CircleAvatar(
                                  child: Icon(favorilists[index].getOntap() == 0
                                      ? Icons.keyboard_arrow_right
                                      : Icons.keyboard_arrow_up),
                                  backgroundColor: Colors.green,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (favorilists[index].getOntap() == 0) {
                                      favorilists[index].setOntap(1);

                                      _update(context, favorilists[index]);
                                    } else {
                                      favorilists[index].setOntap(0);
                                      _update(context, favorilists[index]);
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
                                          sourate: mesSourates[
                                                  favorilists[index]
                                                          .getNumsourate() -
                                                      1]
                                              .sourate,
                                          numero:
                                              '${favorilists[index].getNumsourate()}',
                                          numofindex: (favorilists[index]
                                                  .getNumverset() -
                                              1)),
                                    ));
                              },
                            ),
                            favorilists[index].getOntap() == 1
                                ? Column(
                                    children: <Widget>[
                                      if (Sujod.withStart(
                                          mesSourates[favorilists[index]
                                                      .getNumsourate() -
                                                  1]
                                              .sourate,
                                          favorilists[index].getNumverset()))
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "۞",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22,
                                              color: Parametres.fond
                                                  ? Colors.white70
                                                  : Colors.black,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 30.0, right: 3.0),
                                        padding: EdgeInsets.only(
                                            left: 30.0, right: 3.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            favorilists[index].getVarabe(),
                                            style: TextStyle(
                                              //fontWeight: FontWeight.w500,
                                              fontSize: 28,
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
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          (Sujod.withSujod(
                                                  mesSourates[favorilists[index]
                                                              .getNumsourate() -
                                                          1]
                                                      .sourate,
                                                  favorilists[index]
                                                      .getNumverset()))
                                              ? '﴾${favorilists[index].getNumverset()}﴿ ۩ '
                                              : '﴾${favorilists[index].getNumverset()}﴿',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            fontFamily: 'noorehidayat',
                                            color: Parametres.fond
                                                ? Colors.white70
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      //if(Parametres.trad==true)
                                      SizedBox(height: 3.0),

                                      if (Parametres.trans == true)
                                        Text(
                                          '(${favorilists[index].getNumverset()})' +
                                              ' ' +
                                              '${mesSourates[favorilists[index].getNumsourate() - 1].sourate.versets[favorilists[index].getNumverset() - 1].francais}',
                                          style: GoogleFonts.allerta(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16.0,
                                            color: Colors.green,
                                          ),
                                          overflow: TextOverflow.visible,
                                        ),
                                      if (Parametres.trans == true)
                                        SizedBox(height: 5.0),
                                      Text(
                                        favorilists[index].getVwolof() +
                                            ' ' +
                                            '(${favorilists[index].getNumverset()})',
                                        style: GoogleFonts.allerta(
                                          fontSize: 16.0,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        overflow: TextOverflow.visible,
                                      )
                                    ],
                                  )
                                : Text('')
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
      _showSnackBar(context, 'Suppression effectuee');
      // SnackBar(content: Text('suppression effectue a vec succees'));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Suppression effectuee!'),
      //   ),
      // );

    }

    updateListView();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void _update(BuildContext context, Allfavories favorie) async {
    await databaseHelper.updateFavori(favorie);
    updateListView();
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Allfavories>> favorieFutureList =
          databaseHelper.getFavoriesList();
      favorieFutureList.then((favoriLists) {
        setState(() {
          this.favorilists = favoriLists;
          this.count = favorilists.length;
        });
      });
    });
  }
}
