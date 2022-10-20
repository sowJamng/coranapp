import 'package:coran/Screens/Parametres/Parametres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:coran/Model/Hadith/Hadiths.dart';
import 'package:google_fonts/google_fonts.dart';
class ReadHadith extends StatefulWidget {
  final int  numero;
  final String title;

  const ReadHadith({Key key, this.title,this.numero}) : super(key: key);
  @override
  _ReadHadithState createState() => _ReadHadithState();
}

class _ReadHadithState extends State<ReadHadith> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      body:Center(
              child: Card(
                color: Parametres.fond
                                ? Color(0xFF223645)
                                : Colors.white,
                            margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      hadiths[widget.numero].arabe,
                                      style: TextStyle(
                                        fontSize: 38.0,
                                        fontFamily:
                                            'mequran',
                                        color: Parametres.fond
                                            ? Colors.white
                                            : Colors.black,
                                        letterSpacing: 0.3,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    hadiths[widget.numero].wolof,
                                    style: GoogleFonts.allerta(
                                      fontSize: 16.0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),                        
                              ],
              )
          ),
      ),
    );
  }
}