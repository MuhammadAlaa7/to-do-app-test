import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo_model.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._init();

  static Database? _database;

  TodoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        completed INTEGER
      )
    ''');
  }

  Future<void> create(Todo todo) async {
    final db = await instance.database;
    final id = await db.insert('todos', todo.toMap());
   // return todo.copyWith(id: id);
  }

  Future<List<Todo>> readAll() async {
    final db = await instance.database;
    final maps = await db.query('todos');
    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  Future<void> update(Todo todo) async {
    final db = await instance.database;
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> delete(Todo todo) async {
    final db = await instance.database;
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}