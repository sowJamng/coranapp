import 'package:flutter/material.dart';

import '../../Model/ReadPdf/Readpdf.dart';

class Chapitres extends StatefulWidget {
  @override
  _ChapitresState createState() => _ChapitresState();
}

class _ChapitresState extends State<Chapitres> {
  @override
  Widget build(BuildContext context) { 

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
                              builder: (context) => ReadChapitre(title:'',chap: 'assets/invocations/Debutdelacreation.pdf')));
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
                              builder: (context) => ReadChapitre(title:'',chap :'OrdonnerleBienet.pdf')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap3')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap4')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap5')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap6')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap7')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap8')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap9')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap10')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap11')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap12')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap13')));
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
                              builder: (context) => ReadChapitre(title:'',chap : 'title:'',chap15')));
                        },

                      ),
                    ),
                  ],
                ),
            ),
        );
  }

}


