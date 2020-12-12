import 'package:flutter/material.dart';

import 'Parametres.dart';
import 'SourateSelect.dart';

class Favories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
      color: Parametres.fond ? Color(0xFF223645) : Colors.white,
      child: Column(children: <Widget>[
        SizedBox(
            child: Text('Page Courante',
                style: TextStyle(
                    color: Parametres.fond ? Colors.white : Colors.black))),
        GestureDetector(
          child: Text('sourate courate'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ChatScreen(
                    sourate: null,
                    numero:null)),
          ),

        ),
        SizedBox(
          height:10.0,
          child:Text('Mes Favories',style: TextStyle(
                    color: Parametres.fond ? Colors.white : Colors.black))),

      ]),
      ),
    );
  }
}
