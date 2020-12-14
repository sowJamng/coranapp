import 'package:coran/Model/MesAjiza.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'JuzSelect.dart';
import 'Parametres.dart';


class MyAjiza extends StatefulWidget {
  static List<MesAjiza> ajizadisplay = List<MesAjiza>();
  @override
  _MyAjizaState createState() => _MyAjizaState();
}

class _MyAjizaState extends State<MyAjiza> {
  ScrollController controller = ScrollController();
  List<MesAjiza> _myajizas = List<MesAjiza>();

  @override
  void initState() {
    super.initState();
    _myajizas = mesAjiza;
    MyAjiza.ajizadisplay = _myajizas;
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
          focusColor: Parametres.fond ? Colors.white : Colors.black,
          hintStyle:
              TextStyle(color: Parametres.fond ? Colors.white : Colors.black),
          fillColor: Colors.green,
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            MyAjiza.ajizadisplay = _myajizas.where((ajiza) {
              var nom = ajiza.ajiza.sourate.nom.toLowerCase();
              return nom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAjiza.ajizadisplay.length > 0
        ? Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: SafeArea(
              child: Scrollbar(
                child: ListView.builder(
                  controller: controller,
                  itemCount:
                      Home.search == true && MyAjiza.ajizadisplay.length > 0
                          ? MyAjiza.ajizadisplay.length + 1
                          : MyAjiza.ajizadisplay.length,
                  itemBuilder: (BuildContext context, int index) {
                    MesAjiza chat;
                    Home.search == true && index > 0
                        ? chat = MyAjiza.ajizadisplay[index - 1]
                        : chat = MyAjiza.ajizadisplay[index];
                    return Home.search == true && index == 0
                        ? _searchBar()
                        : GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JusSelect(
                                  ajiza: chat.ajiza,
                                  numeroaya: chat.ajiza.numeroaya,
                                ),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      if ((index == 0) ||
                                          (index == 8) ||
                                          (index == 16) ||
                                          (index == 24) ||
                                          (index == 32) ||
                                          (index == 40) ||
                                          (index == 48) ||
                                          (index == 56) ||
                                          (index == 64) ||
                                          (index == 72) ||
                                          (index == 80) ||
                                          (index == 88) ||
                                          (index == 96) ||
                                          (index == 104) ||
                                          (index == 112) ||
                                          (index == 120) ||
                                          (index == 128) ||
                                          (index == 136) ||
                                          (index == 144) ||
                                          (index == 152) ||
                                          (index == 160) ||
                                          (index == 168) ||
                                          (index == 176) ||
                                          (index == 184) ||
                                          (index == 192) ||
                                          (index == 200) ||
                                          (index == 208) ||
                                          (index == 216) ||
                                          (index == 224) ||
                                          (index == 232))
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.0,
                                          ),
                                          child: Text(
                                            chat.numero,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Card(
                                  color: Parametres.fond
                                      ? Color(0xFF223645)
                                      : Colors.white,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        backgroundColor: chat.hizb == 0
                                            ? Colors.grey
                                            : Color(0xFF05966D),
                                        child: Text(
                                          chat.hizb == 0
                                              ? chat.avanthizb
                                              : '${chat.hizb}',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    title: Text(
                                      chat.ajiza.beginaya,
                                      style: TextStyle(
                                       
                                        fontSize: 22,
                                         fontFamily: 'mequran',
                                        color: Colors.teal,
                                      ),
                                    ),
                                    subtitle: Text(
                                      chat.ajiza.sourate.nom +
                                          ' , ' +
                                          chat.nbaya,
                                      style: TextStyle(
                                        color: Parametres.fond
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
            ),
          )
        : Container(
            color: Parametres.fond ? Color(0xFF223645) : Colors.white,
            child: Center(
              child: Text(
                'Aucun resultat trouvé pour votre recherche',
                style: TextStyle(
                    fontSize: 13.0,
                    color: Parametres.fond ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
