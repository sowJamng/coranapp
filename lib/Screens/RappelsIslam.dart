import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
//import 'main.dart';
class Chapitres extends StatefulWidget {
  @override
  _ChapitresState createState() => _ChapitresState();
}

class _ChapitresState extends State<Chapitres> {
  @override
  Widget build(BuildContext context) { 
    
    // return  WillPopScope(
    //     onWillPop:(){
    //     return showDialog(
    //       context: context,
    //       builder: (context)=>AlertDialog(
    //         title:Text('Warning'),
    //         content:Text('Etes vous sure de vouloir quitter'),
    //         actions:<Widget>[
    //           FlatButton(
    //             onPressed: ()=>Navigator.of(context).pop(true),
    //             child: Text('Oui'),
    //             ),
    //             FlatButton(
    //             onPressed: ()=>Navigator.of(context).pop(false),
    //             child: Text('Non'),
    //            ),
    //          ]
    //       )
    //     );
    //     },
    // child:Scaffold(
      return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
               child:ListView(
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Text('Rappels Islamiques',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold  ), ),
                    SizedBox(height: 20.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Début de la création : Eau, Première Créature, Trône Deuxième Créature',style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.green,fontSize: 16),),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap: 'assets/invocations/Debutdelacreation.pdf')));
                        },
                      ),
                    ),
                        SizedBox(height: 30.0,),
                        //dense: true, cte dans un clistTile
                    Card(
                      child: ListTile(
                       // leading: FlutterLogo(size: 56.0),
                    leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Ordonner le Bien et Interdire le Mal en Islam',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16)),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap :'OrdonnerleBienet.pdf')));
                        },
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        //leading: FlutterLogo(size: 72.0),
    leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 3:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                           )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap3')));
                        },
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 4:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap4')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 5:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap5')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 6:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap6')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 7:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap7')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 8:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap8')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 9:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap9')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 10:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap10')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 11:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap11')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 12:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap12')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 13:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap13')));
                        },

                      ),
                    ),
                     SizedBox(height: 30.0,),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage:AssetImage("assets/home.jfif"),minRadius:20.0,maxRadius:25.0),
                        title: Text('Chapitre 15:',style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.green,fontSize: 16,
                            )),
                        //isThreeLine: true,
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Chapitreone(chap : 'chap15')));
                        },

                      ),
                    ),
                  ],
                ),
            ),
        );
  }

}
class Chapitreone extends StatefulWidget {
  final String  chap;

  const Chapitreone({Key key, this.chap}) : super(key: key);
  @override
  _ChapitreoneState createState() => _ChapitreoneState();
}

class _ChapitreoneState extends State<Chapitreone> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.chap);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // title: Text(
        //   "Invocations et Citadelle du Musulman",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //   textAlign: TextAlign.center,
        // ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              showIndicator: true,
              showPicker: false,
            ),
    );
  }
}

