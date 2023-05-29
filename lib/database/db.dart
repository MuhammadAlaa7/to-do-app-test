import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../controller/controller.dart';

/* 
[1]- don't use the controller onbject in the database file , this file only return values and you take when calling it in the controller file. 

*/

abstract class BaseDataBaseHelper {
  Future<void> initDataBase();

  Future insertDataBase({
    required String title,
    required String date,
    required String time,
  });

  Future getDataFromDataBase();
}

class DataBaseHelper implements BaseDataBaseHelper {
   Database? _database;

  @override
  Future<void> initDataBase() async {
// Get a location using getDatabasesPath
// ignore: unused_local_variable, prefer_interpolation_to_compose_strings
    String databasePath = await getDatabasesPath() + 'tasks.db';

// open the database
    _database = await openDatabase(
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

  @override
  Future insertDataBase({
    required String title,
    required String date,
    required String time,
  }) async {
// Insert some records in a transaction
    await _database!.transaction(
      (txn) async {
        int id1 = await txn.rawInsert(
            'INSERT INTO tasks(title, date, time) VALUES("$title", "$date", "$time")');
        print('inserted1: $id1');
      },
    );
  }

  @override
  Future getDataFromDataBase() async {
     return  await _database!.rawQuery('SELECT * FROM tasks');
    
  }
}

// class DBHelper {
//   static void initDB() async {
// // Get a location using getDatabasesPath
// // ignore: unused_local_variable, prefer_interpolation_to_compose_strings
//     String databasePath = await getDatabasesPath() + 'tasks.db';

// // open the database
//     database = await openDatabase(
//       databasePath,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         // When creating the db, create the table
//         await db.execute(
//           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)',
//         );
//         print('DateBase created...');
//       },
//       onOpen: (Database db) {
//         print('Datebase opened...');
//       },
//     );
//   }

//   static Future insertDB({
//     required String title,
//     required String date,
//     required String time,
//   }) async {
// // Insert some records in a transaction
//     await database!.transaction(
//       (txn) async {
//         int id1 = await txn.rawInsert(
//             'INSERT INTO tasks(title, date, time) VALUES("$title", "$date", "$time")');
//         print('inserted1: $id1');
//       },
//     );
//     getDB();
//   }

//   static Future getDB() async {
//     // Get the records from the database only
//     final result = await database!.rawQuery('SELECT * FROM tasks');
//     return result;
//   }

//   static void deleteDB() async {
//     await deleteDatabase('tasks.db');
//     print('database has been deleted........');
//   }
// }
