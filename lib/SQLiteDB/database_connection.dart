import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'User Details');
    var database = await openDatabase(
        path, version: 2, onCreate: _createTables);
    return database;
  }

  Future<void> _createTables(Database db, int version) async{
    String query = "CREATE TABLE user(id INTEGER PRIMARY KEY,name TEXT,phoneNo TEXT,pincode TEXT,state TEXT,city TEXT,houseNo TEXT,area TEXT,addressType TEXT,selected INTEGER)";
    await db.execute(query);
  }
}