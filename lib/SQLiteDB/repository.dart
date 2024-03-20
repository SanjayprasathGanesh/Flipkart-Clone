import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class Repository{
  late DatabaseConnection _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;
  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }
    else{
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  addAddress(table, data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }
  
  readAddress(table) async{
    var connection = await database;
    return await connection?.query(table);
  }

  updateAddress(data) async{
    var connection = await database;
    return await connection?.update('user', data, where: 'id = ?', whereArgs: [data['id']]);
  }

  deleteAddress(id) async{
    var connection = await database;
    return await connection?.rawQuery("DELETE FROM user WHERE id = $id");
  }

  updateAddressById(id) async{
    var connection = await database;
    return await connection?.rawUpdate("UPDATE user SET selected = 1 WHERE id = $id");
  }

  deUpdateAddressById(id) async{
    var connection = await database;
    return await connection?.rawUpdate("UPDATE user SET selected = 0 WHERE id != $id");
  }

  getSelected() async{
    var connection = await database;
    return await connection?.rawQuery("SELECT * FROM user WHERE selected = 1");
  }


}