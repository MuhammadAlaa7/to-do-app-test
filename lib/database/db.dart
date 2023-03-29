import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? database;

  static void initDB() async {
// Get a location using getDatabasesPath
// ignore: unused_local_variable, prefer_interpolation_to_compose_strings
    String databasePath = await getDatabasesPath() + 'tasks.db';

// open the database
    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)',
        );
        print('DateBase created...');
      },
      onOpen: (Database db) {
        print('Datebase opened...');
      },
    );
  }

  static Future insertDB(
    {
    required String title,
    required String date,
    required String time,
  }) async {
// Insert some records in a transaction
    await database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO tasks(title, date, time) VALUES("$title", "$date", "$time")');
      print('inserted1: $id1');
    });
  }

  static Future getDB() async {
    // Get the records
    List<Map> tasks = await database!.rawQuery('SELECT * FROM tasks');
     print('this is the task number one : ${tasks}'); 
  }
  

  static void deleteDB()async
  {
      await deleteDatabase('tasks.db');
      print('database has been deleted........');
  }
}
