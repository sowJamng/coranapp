import 'package:coran/Model/Lecteurs/Lecteurs.dart';
import 'package:flutter/material.dart';

class Parametres extends StatefulWidget {
  static bool trad = true;
  static bool fond = false;
  static bool trans = true;
  static Lecteur lecteur = Lecteur.meslecteurs[0];
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05966D),
      appBar: AppBar(
        //05966D a pr
        backgroundColor: Color(0xFF05966D),
        title: Text('Jagal yi'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            SwitchListTile(
              title: const Text('Mélo', style: TextStyle(color: Colors.white)),
              subtitle:
                  Text("Mélo wu nuul", style: TextStyle(color: Colors.white)),
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
              title: const Text('Tekki',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.white)),
              subtitle: Text("Feenal Tekki gi ci wolof",
                  style: TextStyle(color: Colors.white)),
              value: Parametres.trad,
              onChanged: (bool value) {
                setState(() {
                  Parametres.trad = value;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
            ),
            SizedBox(
              height: 10.0,
            ),
            SwitchListTile(
              title:
                  const Text('Bindaan', style: TextStyle(color: Colors.white)),
              subtitle: Text("Feenal mbindaan mi",
                  style: TextStyle(color: Colors.white)),
              value: Parametres.trans,
              onChanged: (bool value) {
                setState(() {
                  Parametres.trans = value;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
            ),
            Text('Tànn ab jàngkat',
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      value: _selectedlecteur,
                      items: _dropdownmenuItems,
                      onChanged: (_value) => onChangeLecteur(_value),
                      isExpanded: false,
                      hint: Text('jàngkat',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
