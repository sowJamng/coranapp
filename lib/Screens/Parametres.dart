
import 'package:coran/Model/Lecteurs.dart';
import 'package:flutter/material.dart';

class Parametres extends StatefulWidget {
  static bool trad = true;
  static bool fond = false;
  static  bool trans = true;
 // static Sourate continuesourate = fatiya;
  //static String num = "001";
  static Lecteur lecteur= Lecteur.meslecteurs[0];
  @override
  _ParametresState createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  List<DropdownMenuItem<Lecteur>> _dropdownmenuItems;
  Lecteur _selectedlecteur;
  @override
  void initState() {
    _dropdownmenuItems = buildDropdownItem(Lecteur.meslecteurs);
    _selectedlecteur = _dropdownmenuItems[0].value;
    super.initState();
  }


  List<DropdownMenuItem<Lecteur>> buildDropdownItem(List lecteurs) {
    List<DropdownMenuItem<Lecteur>> items = List();
   lecteurs.forEach((lecteur) {
     items.add(DropdownMenuItem(
          value: lecteur,
          child:
              Text(lecteur.prenom + ' ' + lecteur.nom)));
    
   }) ;
      

    return items;
  }

  onChangeLecteur(Lecteur select) {
    setState(() {
      _selectedlecteur = select;
      Parametres.lecteur=_selectedlecteur;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color(0xFF05966D),
      appBar: AppBar(
        //05966D a pr
        backgroundColor: Color(0xFF05966D),
        title: Text('Parametres'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //SwitchListTile(
            // title: const Text('Gestion des audios',style: TextStyle(color:Colors.white)),
            // subtitle: Text('Gestion de telechargement des Audios',style: TextStyle(color:Colors.white),),
            // value: _lights,
            // onChanged: (bool value) {
            //   setState(() {
            //     _lights = value;
            //   });
            // },
            // secondary: const Icon(Icons.lightbulb_outline),
            //    ),
            SizedBox(
              height: 15.0,
            ),
            SwitchListTile(
              title: const Text('Thème',
                  style: TextStyle(color: Colors.white)),
              subtitle:
                  Text("Thème Sombre", style: TextStyle(color: Colors.white)),
              value: Parametres.fond,
              onChanged: (bool value) {
                setState(() {
                  Parametres.fond = value;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              secondary: const Icon(Icons.lightbulb_outline),
            ),
            SizedBox(
              height: 10.0,
            ),

            SwitchListTile(
              title: const Text('Traduction',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.white)),
              subtitle: Text("Afficher la traduction en wolof",
                  style: TextStyle(color: Colors.white)),
              value: Parametres.trad,
              onChanged: (bool value) {
                setState(() {
                  Parametres.trad = value;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              // secondary: const Icon(Icons.),
            ),
            SizedBox(
              height: 10.0,
            ),

            SwitchListTile(
              title: const Text('Transcription ',
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("Afficher la transcription",
                  style: TextStyle(color: Colors.white)),
              value: Parametres.trans,
              onChanged: (bool value) {
                setState(() {
                  Parametres.trans = value;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              //secondary: const Icon(Icons.text_fields),
            ),
            Text('Selectionner un Lecteur',
                style: TextStyle(color: Colors.white,fontSize: 15.0)),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    //SizedBox(height:10.0),
                    DropdownButton(
                      value: _selectedlecteur,
                      items: _dropdownmenuItems,
                      onChanged: (_value) => onChangeLecteur(_value),
                      isExpanded: false,
                      hint: Text('Lecteur',
                          style: TextStyle(color: Colors.white)),
                    ),
                    // FlatButton(
                    //   child: new Text(
                    //     'Ok',
                    //     style: TextStyle(color: Colors.white,fontSize: 12.0),
                    //   ),
                    //   onPressed: () {
                    //     // Navigator.push(context,
                    //     //       MaterialPageRoute(
                    //     //         builder: (_) => Search(lecteur:_selectedlecteur,numero:_selectedverset.numero),
                    //     //       ),
                    //     //       );
                    //      Parametres.lecteur=_selectedlecteur;
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // displayDialogue(BuildContext context) async {
  //   return Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               DropdownButton(
  //                 value: _selectedlecteur,
  //                 items: _dropdownmenuItems,
  //                 onChanged: (_value) => onChangeLecteur(_value),
  //                 isExpanded: false,
  //                 hint: Text('lecteur'),
  //               ),
  //               FlatButton(
  //                 child: new Text(
  //                   'Ok',
  //                   style: TextStyle(color: Colors.green),
  //                 ),
  //                 onPressed: () {
  //                   // Navigator.push(context,
  //                   //       MaterialPageRoute(
  //                   //         builder: (_) => Search(lecteur:_selectedlecteur,numero:_selectedverset.numero),
  //                   //       ),
  //                   //       );
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //   );
  // }
}
