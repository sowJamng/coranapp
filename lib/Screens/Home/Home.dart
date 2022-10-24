import 'package:coran/BaseDonnees/DatabaseSourate.dart';
import 'package:coran/Model/sourates/Allsourate.dart';
import 'package:coran/Model/Ajiza/MesAjiza.dart';
import 'package:coran/Model/sourates/MesSourates.dart';
import 'package:coran/Model/Menu/MyPopupItem.dart';
import 'package:coran/Screens/Parametres/Parametres.dart';
import 'package:coran/Screens/Rappelslam/RappelsIslam.dart';
import 'package:coran/Model//ReadPdf/ReadPdf.dart';
import 'package:coran/Screens/ScreenSourates/sourates.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../ScreenJuz/Ajiza.dart';
import '../ScreenFavories/ListFavories.dart';
import '../ScreenSourates/SourateSelect.dart';

class Home extends StatefulWidget {
  static bool search = false;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  DatabaseHelperSourate helpersourate = DatabaseHelperSourate();

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
                    sourate: sourate,
                    numero: numero,
                    numofindex: numofindex,
                  )),
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
      final TextStyle textStyle = Theme.of(context).textTheme.bodyText2;
      final List<Widget> aboutBoxChildren = <Widget>[
        SizedBox(height: 24),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  style: TextStyle(
                    color: Color(0xFF05966D),
                  ),
                  text: "Ki Firi kamil bi:Sén Seexuna Loo Ngaabu, "
                      '\n Ni ko bindaat ci loyi laten yi:Sen Allaji Mamadou Ngeer ak Sen Goor-gi Jaw '
                      '\n Ni taxawe saytouwaat gi ak nonal gi: Mbootayug WAX(Wolof ak Xamle)\n'),
              TextSpan(
                  style:
                      textStyle.copyWith(color: Theme.of(context).accentColor),
                  text:
                      'https://play.google.com/store/apps/details?id=www.islam.sn.coran'),
              TextSpan(style: textStyle, text: '.'),
            ],
          ),
        ),
      ];
      if (item == listitem[4])
        showAboutDialog(
          context: context,
          applicationVersion: '1.0',
          applicationIcon: Icon(Icons.book),
          applicationName: 'Al Xuraan',
          applicationLegalese: '\u{a9} islam.sn 2021 ',
          children: aboutBoxChildren,
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
        });
      });
    });
  }

  @override
  void initState() {
    updateListView();

    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    if (listsourateCourante == null) {
      listsourateCourante = <SourateCourante>[];
      updateListView();
      sourate = fatiya;
      numero = mesSourates[0].getNumero();
      numofindex = 0;
    }
    updateListView();

    if (listsourateCourante.length > 0) {
      sourateCourante = listsourateCourante[listsourateCourante.length - 1];
      sourate = mesSourates[sourateCourante.getNumsourate() - 1].getSourate();
      numero = mesSourates[sourateCourante.getNumsourate() - 1].getNumero();
      numofindex = sourateCourante.getNumverset();
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF05966D),
          title: CircleAvatar(
            backgroundImage: AssetImage('assets/home.jfif'),
            minRadius: 20,
            maxRadius: 30,
          ),
          elevation: 3.2,
          actions: <Widget>[
            Home.search
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      setState(() {
                        Home.search = false;
                        Sourates.souratesdisplay = mesSourates;
                        MyAjiza.ajizadisplay = mesAjiza;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        Home.search = true;
                      });
                    }),
            IconButton(
                icon: Icon(Icons.book),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReadChapitre(
                                title: 'La Citadelle du Musulman',
                                chap: 'assets/invocations/citadelle.pdf',
                              )));
                }),
            PopupMenuButton<MyPopupItem>(
                elevation: 0,
                initialValue: _select,
                onCanceled: () {},
                onSelected: _selectedItem,
                color: Color(0xFF05966D), //Color(0xFF223645),
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
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: <Widget>[
              new Tab(text: "Saar yi"),
              new Tab(text: "Xaaj yi"),
              new Tab(text: "Tanneef"),
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
