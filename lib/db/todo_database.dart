import 'package:demo_to_do_list/db/todo_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoDatabase {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static Database _database;
  static const initScript = [ToDoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [ToDoTable.CREATE_TABLE_QUERY];

  Database get database => _database;

  TodoDatabase._internal();

  static final TodoDatabase _databaseTodoSingleton = TodoDatabase._internal();

  factory TodoDatabase() {
    return _databaseTodoSingleton;
  }

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      initScript.forEach((element) async {
        await db.execute(element);
      });
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((element) async {
        await db.execute(element);
      });
    },version: DB_VERSION);
  }
}
