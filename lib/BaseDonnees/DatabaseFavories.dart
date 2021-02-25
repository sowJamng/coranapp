import 'package:coran/Model/favories/Allfavories.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //on cree une seule instance globale
  static Database _database; // un seul singletron db
  DatabaseHelper._createInstance(); //constructeur nomme pour creer une instance de dbHelper

  String favorieTable = 'favo_table';
  String colId = 'id';
  String colDate = 'date';
  String colNumsourate = 'numsourate';
  String colOntap = 'ontap';
  String colVarabe = 'varabe';
  String colVwolof = 'vwolof';
  String colNumverset = 'numverset';
  String colNomsourate = 'nomsourate';

  factory DatabaseHelper() {
    //on utilise factory pour que lle constructeur puissse retourner une valeur
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); // il sera execute qu une seule fois
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
    String path = directory.path + 'favo.db';
    var favoriDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return favoriDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $favorieTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colDate TEXT,$colVarabe String,$colVwolof String,$colNumverset INTEGER,$colNomsourate String,$colNumsourate INTEGER,$colOntap INTEGER )');
  }

  Future<List<Map<String, dynamic>>> getFavorieMapList() async {
    Database db = await this.database;
    //var result= await db.rawQuery('SELECT * FROM $favorieTable order by $colDate ASC');
    var result = await db.query(favorieTable, orderBy: '$colDate ASC');
    return result;
  }

  // get la liste des favories en format map (List<Map>)  et le convertir en liste de favorie [list<favori>]
  Future<List<Allfavories>> getFavoriesList() async {
    var favoriMapList =
        await getFavorieMapList(); //get Map<LIST> from the database
    int count =
        favoriMapList.length; //count the number of map entries in db table
    List<Allfavories> favorilist = <Allfavories>[];
    for (int i = 0; i < count; i++) {
      favorilist.add(Allfavories.fromMapObject(favoriMapList[i]));
    }

    return favorilist;
  }

  Future<int> insertFavori(Allfavories favori) async {
    Database db = await this.database;
    //
    var result = await db.insert(favorieTable, favori.toMap());
    return result;
  }

  Future<bool> exist(int numverset, int numsourate) async {
    Database db = await this.database;
    var exist = await db.rawQuery(
        'select * from $favorieTable WHERE $colNumverset= $numverset and $colNumsourate=$numsourate');
    if (exist.length == 0)
      return false;
    else
      return true;
  }

  Future<int> updateFavori(Allfavories favori) async {
    Database db = await this.database;
    var result = await db.update(favorieTable, favori.toMap(),
        where: '$colId=?', whereArgs: [favori.id]);
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $favorieTable WHERE $colId=$id');
    return result;
  }

  Future<List<Map<String, dynamic>>> getFavori(int id) async {
    Database db = await this.database;
    var result =
        await db.rawQuery('SELECT * FROM $favorieTable WHERE $colId=$id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $favorieTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
