import 'dart:io' as io;
import 'dart:async';

import 'package:crowd_music/user/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    /*String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, "main.db");*/
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);     //inits DB and runs onCreate Function
    return theDb;
  }


  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE u_sessions(u_id INTEGER PRIMARY KEY, u_uid TEXT, u_token TEXT)"); //Creates Database
    print("Created table");
  }

  Future<List> getUserData() async {
    var dbClient = await db;
    List<Map> userDetails = await dbClient.rawQuery('SELECT * FROM u_session');   //returns all User Data as Map
    return userDetails;
  }

  Future<bool> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("u_session", user.createSession());  //returns true if User with [uid] has been deleted, else returns false
    return res >  0 ? true : false;
  }

  Future<int> deleteUsers(String uid) async {
    var dbClient = await db;
    int res = await dbClient.delete("u_session");  //returns User Data if u_loggedin = true, if there is no u_loggedin = true returns false
    return res;
  }
}