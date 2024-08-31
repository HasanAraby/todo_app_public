import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task_model.dart';

class DbHelper {
  // static final DbHelper _instance = DbHelper().internal;
  // factory DbHelper() => _instance;
  // DbHelper.internal();
  // DbHelper get internal => _instance;

  DbHelper._();
  static final DbHelper _x = DbHelper._();
  factory DbHelper() {
    return _x;
  }

  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'app.db');

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int v) async {
      await db.execute('''CREATE TABLE tasks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
     title VARCHAR,
     body VARCHAR
    )''');
    });
    return _db!;
  }

  Future<List>? readTasks() async {
    Database db = await createDatabase();
    List list = await db.query('tasks');
    return list;
  }

  Future<int>? insertTask(Task task) async {
    Database db = await createDatabase();
    return await db.insert('tasks', task.toMap());
  }

  Future<int>? deleteTask(int id) async {
    Database db = await createDatabase();
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int>? updateTask(Task task) async {
    Database db = await createDatabase();
    return await db
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  //delet all raws
  deleteAll() async {
    Database db = await createDatabase();
    return await db.rawDelete("DELETE FROM tasks");
  }

  //insert all raws
  insertAll(List list) async {
    Database db = await createDatabase();

    for (Map<String, dynamic?> task in list) {
      await db.insert('tasks', task);
    }
  }
}
