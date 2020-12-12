

import 'package:coran/BaseDonnees/DatabaseSourate.dart';
import 'package:coran/Model/Allsourate.dart';
import 'package:coran/Model/MesAjiza.dart';
import 'package:coran/Model/MesSourates.dart';
import 'package:coran/Model/MyPopupItem.dart';
import 'package:coran/Screens/Invocations.dart';
import 'package:coran/Screens/Parametres.dart';
import 'package:coran/Screens/RappelsIslam.dart';
import 'package:coran/Screens/sourates.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'Ajiza.dart';
import 'ListFavories.dart';
import 'SourateSelect.dart';

class Home extends StatefulWidget {
  static bool search=false;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  // List<DropdownMenuItem<Sourate>> _dropdownmenuItems;
  // List<DropdownMenuItem<Verset>> _dropdownmenuItemsv;
  //Sourate _selectedsourate;
  DatabaseHelperSourate helpersourate=DatabaseHelperSourate();
  
  List<SourateCourante> listsourateCourante;
  SourateCourante sourateCourante;
  Sourate sourate;
  String numero;
  int numofindex;
  // Verset _selectedverset;
  bool disabledDown = true;
  MyPopupItem _select = listitem[0]; 

  void _selectedItem(MyPopupItem item) {
    setState(() {
      _select = item;
       
      if (item == listitem[0])
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChatScreen(
                sourate: sourate,numero: numero,
                numofindex: numofindex,)                 
                  ),
        );
      if (item == listitem[1])
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Chapitres(),
          ),
        );
      if (item == listitem[2])
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Parametres(),
          ),
        );
     
    });
  }


  void updateListView() {
    final Future<Database> dbFuture = helpersourate.initializeDatabase();
    dbFuture.then((database) {
      Future<List<SourateCourante>> favorieFutureList =
          helpersourate.getSouratesList();
      favorieFutureList.then((souratesLists) {
        setState(() {
          this.listsourateCourante = souratesLists;
        //  this.count = favoriLists.length;
        });
      });
    });
  }

  @override
  void initState() {
    // _dropdownmenuItems = buildDropdownItem(sourates);
    // _selectedsourate = _dropdownmenuItems[0].value;
    // _dropdownmenuItemsv = buildDropdownItemv(_selectedsourate.versets);
    // _selectedverset = _dropdownmenuItemsv[0].value;
     updateListView();

    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  // List<DropdownMenuItem<Sourate>> buildDropdownItem(List sourates) {
  //   List<DropdownMenuItem<Sourate>> items = List();
  //   for (Sourate sourate in sourates) {
  //     items.add(DropdownMenuItem(value: sourate, child: Text(sourate.nom)));
  //   }

  //   return items;
  // }

  // List<DropdownMenuItem<Verset>> buildDropdownItemv(List versets) {
  //   List<DropdownMenuItem<Verset>> items = List();
  //   for (Verset verset in versets) {
  //     items.add(
  //         DropdownMenuItem(value: verset, child: Text('${verset.numero}')));
  //   }

  //   return items;
  // }

 

  // onChangeSourate(_value) {
  //   setState(() {
  //     _selectedsourate = _value;
  //     disabledDown = false;
  //   });
  // }

  // onChangeDropdownItemVerset(_value) {
  //   setState(() {
  //     _selectedverset = _value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if(listsourateCourante==null){
      listsourateCourante= List<SourateCourante>();
      updateListView();
      sourate=fatiya;
      numero=mesSourates[0].numero;
      numofindex=0;

    }
    updateListView();

   // print('la longeur de la liste est ${listsourateCourante.length}');
   if(listsourateCourante.length>0)
  {  sourateCourante=listsourateCourante[listsourateCourante.length-1];
    sourate=mesSourates[sourateCourante.getNumsourate()-1].sourate;
    numero=mesSourates[sourateCourante.getNumsourate()-1].numero;
    numofindex=sourateCourante.getNumverset();
  }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF05966D),
         title: 
    CircleAvatar(
            backgroundImage: AssetImage('assets/home.jfif'),
            minRadius: 20,
            maxRadius: 30,
          ), 
          elevation: 3.2,
          actions: <Widget>[
             Home.search?
                IconButton(
                icon: Icon(Icons.cancel,
                color: Colors.orange,
                ),
                onPressed: (){
                   setState(() {
                      Home.search=false;
                      Sourates.souratesdisplay=mesSourates;
                      MyAjiza.ajizadisplay=mesAjiza;
                   }); 
                  }//=>_searchBar(),
                ):
            IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  //_searchBar();
                   setState(() {
                      Home.search=true;
                   }); 
                  }//=>_searchBar(),
                ),// => displayDialogue(context)),
            IconButton(
                icon: Icon(Icons.book),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Lecture()));
                }),
            PopupMenuButton<MyPopupItem>(
                elevation: 0,
                initialValue: _select,
                onCanceled: () {
                  print('on canceled was called');
                },
                onSelected: _selectedItem,
                color: Color(0xFF05966D),//Color(0xFF223645),
                itemBuilder: (BuildContext context) {
                  return listitem.map((MyPopupItem choice) {
                    return PopupMenuItem<MyPopupItem>(
                      value: choice,
                      child: choice.listTile,
                    );
                  }).toList();
                })
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(text: "Sourates"),
              new Tab(text: "Ajiza"),
              new Tab(text: "Favoris"),
            ],
          )),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Sourates(),
          new MyAjiza(),
          new ListFavories(),
        ],
      ),
     
    );
  }

}
