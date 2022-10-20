import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class SourateCourante {
  int id;
  int numsourate;
  int ontap = 0;
  String date;
  int numverset;

  SourateCourante(this.date, this.numsourate, this.ontap, this.numverset);
  SourateCourante.withId(
      {this.id, this.date, this.numsourate, this.ontap, this.numverset});

  int getId() => this.id;
  int getNumsourate() => this.numsourate;
  int getOntap() => this.ontap;
  String getDate() => date;
  int getNumverset() => this.numverset;

  setDate(String newdate) {
    this.date = newdate;
  }

  setNumsourate(int numsourate) {
    this.numsourate = numsourate;
  }

  setOntap(int ontap) {
    this.ontap = ontap;
  }

  setNumverset(int numverset) {
    this.numverset = numverset;
  }

  //conversion des objet souratees en type map du fait que la database sql lite prend des donnees mappe et les renvoies
//le type string est la cle  et dynamic cest pour dire que la valeur peut etre de type int ou string ou verset ou autres
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['numsourate'] = numsourate;
    map['date'] = date;
    map['ontap'] = ontap;
    map['numverset'] = numverset;
    return map;
  }
//fonction pour extraite les donnees mappes pour les avoir en objet souratees a partir des objet map dynamic car on a dif types

  SourateCourante.fromMapObjet(Map<String, dynamic> map) {
    //extraction
    this.id = map['id'];
    this.date = map['date'];
    this.numsourate = map['numsourate'];
    this.ontap = map['ontap'];
    this.numverset = map['numverset'];
  }
}

//reference
//https://www.w3resource.com/sqlite-exercises/sqlite-subquery-exercise-14.php
class DatabaseHelperSourate {
  static DatabaseHelperSourate
      _databaseHelper; //on cree une seule instance globale
  static Database _database; // un seul singletron db
  DatabaseHelperSourate._createInstance(); //constructeur nomme pour creer une instance de dbHelper
  String souraTable = 'sour_table';
  String colId = 'id';
  String colDate = 'date';
  String colNumsourate = 'numsourate';
  String colOntap = 'ontap';
  String colNumverset = 'numverset';
  //String colFond='fond';

  factory DatabaseHelperSourate() {
    //on utilise factory pour que lle constructeur puissse retourner une valeur
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelperSourate
          ._createInstance(); // il sera execute qu une seule fois
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initializeDatabase();

    return _database;
  }

  //initialiser la base de donnee
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'sour.db';
    var sourateDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return sourateDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $souraTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colDate TEXT,$colNumsourate INTEGER,$colOntap INTEGER ,$colNumverset INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getSouratesMapList() async {
    Database db = await this.database;
    //var result= await db.rawQuery('SELECT * FROM $sourateeTable order by $colDate ASC');
    var result = await db.query(souraTable, orderBy: '$colDate ASC');
    return result;
  }

  // get la liste des souratees en format map (List<Map>)  et le convertir en liste de souratee [list<sourate>]
  Future<List<SourateCourante>> getSouratesList() async {
    var souratesMapList =
        await getSouratesMapList(); //get Map<LIST> from the database
    int count =
        souratesMapList.length; //count the number of map entries in db table
    List<SourateCourante> souratelist = <SourateCourante>[];
    for (int i = 0; i < count; i++) {
      souratelist.add(SourateCourante.fromMapObjet(souratesMapList[i]));
    }
    return souratelist;
  }

  //recuperation de la derniere sourate inserée
  Future<List<Map<String, dynamic>>> getSourateCouranteMapList() async {
    Database db = await this.database;
    var result = await db.query(souraTable, orderBy: '$colId DESC LIMIT 1');
    return result;
  }

  //mettre dans une liste la derniere sourate insere
  Future<List<SourateCourante>> getSouratesCourante() async {
    var souratesMapList =
        await getSourateCouranteMapList(); //get Map<LIST> from the database
    int count =
        souratesMapList.length; //count the number of map entries in db table
    List<SourateCourante> souratelist = <SourateCourante>[];
    for (int i = 0; i < count; i++) {
      souratelist.add(SourateCourante.fromMapObjet(souratesMapList[i]));
    }
    return souratelist;
  }

  //les 7 favorie sourates
  Future<List<Map<String, dynamic>>> getSourateFavoriMapList() async {
    Database db = await this.database;
    var result = await db.query(souraTable, orderBy: '$colId DESC LIMIT 5');
    return result;
  }

  Future<List<SourateCourante>> getSouratesFavori() async {
    var souratesMapList =
        await getSourateFavoriMapList(); //get Map<LIST> from the database
    int count =
        souratesMapList.length; //count the number of map entries in db table
    List<SourateCourante> souratelist = <SourateCourante>[];
    for (int i = 0; i < count; i++) {
      souratelist.add(SourateCourante.fromMapObjet(souratesMapList[i]));
    }
    return souratelist;
  }

  Future<int> insertSourate(SourateCourante sourate) async {
    Database db = await this.database;
    var result = await db.insert(souraTable, sourate.toMap());
    return result;
  }

  Future<int> updateSourate(SourateCourante sourate) async {
    Database db = await this.database;
    var result = await db.update(souraTable, sourate.toMap(),
        where: '$colId=?', whereArgs: [sourate.id]);
    return result;
  }

  Future<bool> exist(int nums, int numv) async {
    Database db = await this.database;
    var result = await db.rawQuery(
        'SELECT * FROM $souraTable WHERE $colNumsourate=$nums and $colNumverset=$numv');
    if (result.length != null)
      return true;
    else
      return false;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $souraTable WHERE $colId=$id');
    return result;
  }

  Future<int> deleteAll() async {
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $souraTable');
    return result;
  }

  Future<List<Map<String, dynamic>>> getsourate(int id) async {
    Database db = await this.database;
    var result =
        await db.rawQuery('SELECT * FROM $souraTable WHERE $colId=$id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $souraTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
