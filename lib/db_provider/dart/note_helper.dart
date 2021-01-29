import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_information/models/note.dart';

class DatabaseHelper{

  static final _databaseName ="MyDatabase.db";
  static final _databaseVersion = 1;
  static final table ='my_table';

  static final columnId='_id';
  static final columnName='name';
  static final columnAge='age';

  DatabaseHelper._privateConstructorName();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructorName();


  static Database _database;

  Future<Database> get database async{
    if( _database != null)
      return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }


  ///// Create data base  table

  Future _onCreate(Database db,int version) async {
    await db.execute(''' 
    CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT Null,
      $columnAge INTEGER NOT Null),
    ''');

  }

  //// Insert data in to table

  Future<int> insert (Map<String, dynamic> row) async {
    Database db =await instance.database;
    return await db.insert(table, row);
  }

// data Storing values in MAP structure it will store the values in Kye and value pair
  Future<List<Map<String, dynamic>>> queryAllRows() async{
    Database db =await instance.database;

    return await db.query(table);
  }
 /////this query showing how may datas stored in my table

  Future<int> queryRowCount() async {
    Database db =await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*)FROM $table'));

  }
  Future<List<Note>> getEmployees() async {
    var dbClient = await instance.database;
    List<Map> maps = await dbClient.query(table, columns: [columnId, columnName,columnAge]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Note> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Note.fromMap(maps[i]));
      }
    }
    return employees;
  }

  ///// this Query update / modify my table

  Future<int> update(Map<String, dynamic> row)async{
    Database db =await instance.database;
    int id =row[columnId];
    return await db.update(table, row, where: '$columnId=?', whereArgs:[id]);

  }

  //// this query Delete data from table

  Future<int> delete(Map<String, dynamic> row ) async{
    Database db=await instance.database;
    int id =row[columnId];
    return await db.delete(table, where:'$columnId=?', whereArgs:[id]);
  }




}

