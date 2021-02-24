import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Model/sourates/MesSourates.dart';
import '../Parametres/Parametres.dart';
import 'SourateSelect.dart';
import '../Home/Home.dart';

class Sourates extends StatefulWidget {
  static List<MesSourates> souratesdisplay = <MesSourates>[];

  @override
  _SouratesState createState() => _SouratesState();
}

class _SouratesState extends State<Sourates> {
  List<MesSourates> _mysourates = <MesSourates>[];
  @override
  void initState() {
    super.initState();
    _mysourates = mesSourates;
    Sourates.souratesdisplay = _mysourates;
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(
            color: Parametres.fond ? Colors.white : Colors.black,
            fontSize: 16.0),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle:
              TextStyle(color: Parametres.fond ? Colors.white : Colors.black),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            Sourates.souratesdisplay = _mysourates.where((sourate) {
              var nom = sourate.sourate.nom.toLowerCase();
              return nom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sourates.souratesdisplay.length > 0
        ? Container(
            color: //fondinit.getFont()==0 ? Color(0xFF223645) : Colors.white,
                Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: SafeArea(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: Home.search == true &&
                            Sourates.souratesdisplay.length > 0
                        ? Sourates.souratesdisplay.length + 1
                        : Sourates.souratesdisplay.length,
                    itemBuilder: (BuildContext context, int index) {
                      MesSourates chat;
                      Home.search == true && index > 0
                          ? chat = Sourates.souratesdisplay[index - 1]
                          : chat = Sourates.souratesdisplay[index];
                      return (Home.search == true && index == 0) ||
                              (Sourates.souratesdisplay.length == 0)
                          ? _searchBar()
                          : GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    sourate: chat.sourate,
                                    numero: chat.numero,
                                    numofindex: 0,
                                  ),
                                ),
                              ),
                              child: Column(children: <Widget>[
                                Card(
                                  color: Parametres.fond
                                      ? Color(0xFF223645)
                                      : Colors.white,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        backgroundColor: Color(0xFF05966D),
                                        child: Text('${chat.sourate.numero}')),
                                    title: Text(
                                      chat.sourate.nom,
                                      style: GoogleFonts.alike(
                                        fontSize: 15.0,
                                        color: Parametres.fond
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      chat.nbaya,
                                      style: GoogleFonts.alike(
                                        color: Parametres.fond
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      chat.sourate.nomarabe,
                                      style: TextStyle(
                                          fontFamily: 'mcsgf',
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                    }),
              ),
            ),
          )
        : Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: Center(
              child: Text(
                'Sa ceet gi jurul dara',
                style: TextStyle(
                    fontSize: 13.0,
                    color: Parametres.fond ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
