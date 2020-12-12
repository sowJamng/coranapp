import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MyPopupItem {
  // String title;
  // IconData icon;
  ListTile listTile;
  // MyPopupItem({this.listTile, this.title, this.icon});
  MyPopupItem({this.listTile});
}


List<MyPopupItem> listitemsurate = <MyPopupItem>[
   MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.zoom_in,color: Colors.white,),
        title: Text("Augmenter la taille",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0,color: Colors.white)),
            
        //onTap: (){}
  ),),
  MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.zoom_out,color: Colors.white,),
        title: Text("Diminuer la taille la taille",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0,color: Colors.white)),
            
        //onTap: (){}
  ),),
   MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.settings_backup_restore,color: Colors.white,),
        title: Text("Réinitialiser la taille",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0,color: Colors.white)),
            
        //onTap: (){}
  ),),
];
List<MyPopupItem> listitem = <MyPopupItem>[
  MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.chrome_reader_mode,color: Colors.white,),
        title: Text("Continuer la Lecture",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,color: Colors.white)),
            
        //onTap: (){}
  ),),
    MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.book,color: Colors.white,),
        title: Text("Rappel Islamique",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,color: Colors.white)),
            
  ),),
  // MyPopupItem(listTile: ListTile(
  //       leading: Icon(Icons.audiotrack,color: Colors.white,),
  //       title: Text("Audio Manager",
  //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,color: Colors.white)),
            
  //       onTap: (){

  //       }
  // ),),
  MyPopupItem(listTile: ListTile(
        leading: Icon(Icons.settings,color: Colors.white,),
        title: Text("Parametres",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,color: Colors.white)),
            
       // onTap: (){ }
  ),),
  MyPopupItem(
    listTile: ListTile(
        leading: Icon(Icons.share,color: Colors.white,),
        title: Text("Partager L'application",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0,color: Colors.white)),
        onTap: () => Share.share(
            "Apprendre et écouter le coran avec la traduction de chaque verset en wolof sur https://play.google.com/store/apps/details?id=ucad.edu.sn.coran")),
  ),
];
