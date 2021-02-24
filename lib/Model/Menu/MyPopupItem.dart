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
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.zoom_in,
        color: Colors.white,
      ),
      title: Text("Yokk dayo bi",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white)),

      //onTap: (){}
    ),
  ),
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.zoom_out,
        color: Colors.white,
      ),
      title: Text("Wanni dayo bi",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Colors.white)),

      //onTap: (){}
    ),
  ),
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.settings_backup_restore,
        color: Colors.white,
      ),
      title: Text("Fomp dayo bi",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Colors.white)),

      //onTap: (){}
    ),
  ),
];
List<MyPopupItem> listitem = <MyPopupItem>[
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.chrome_reader_mode,
        color: Colors.white,
      ),
      title: Text("Wéyal njàng mi",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: Colors.white)),

      //onTap: (){}
    ),
  ),
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.book,
        color: Colors.white,
      ),
      title: Text("Pàttalil diiné",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: Colors.white)),
    ),
  ),
  // MyPopupItem(listTile: ListTile(
  //       leading: Icon(Icons.audiotrack,color: Colors.white,),
  //       title: Text("Audio Manager",
  //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,color: Colors.white)),

  //       onTap: (){

  //       }
  // ),),
  MyPopupItem(
    listTile: ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      title: Text("Parametres",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: Colors.white)),

      // onTap: (){ }
    ),
  ),
  MyPopupItem(
    listTile: ListTile(
        leading: Icon(
          Icons.share,
          color: Colors.white,
        ),
        title: Text("Tasaare jafekaay gi",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: Colors.white)),
        onTap: () => Share.share(
            "Apprendre et écouter le coran avec la traduction de chaque verset en wolof sur https://play.google.com/store/apps/details?id=www.islam.sn.coran")),
  ),
];
