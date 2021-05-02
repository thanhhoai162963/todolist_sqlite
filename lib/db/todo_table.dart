import 'package:demo_to_do_list/db/todo_database.dart';
import 'package:demo_to_do_list/model/to_do.dart';
import 'package:sqflite/sqflite.dart';

class ToDoTable {
  static const TABLE_NAME = 'todo';
  static const CREATE_TABLE_QUERY ='''
   CREATE TABLE $TABLE_NAME (
      id INTEGET PRIMARY KEY,
      name TEXT
   );
   ''';
  static const DROP_TABLE_QUERY = '''
   DROP TABLE IF EXISTS $TABLE_NAME
   ''';
  Future<int> insertTodo(ToDo toDo){
    final Database db = TodoDatabase().database;
    return db.insert(TABLE_NAME,toDo.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> deleteTodo(ToDo toDo) async{
    final Database db = TodoDatabase().database;
    await  db.delete(TABLE_NAME,where: 'id = ?',whereArgs: [toDo.id]);
  }
  Future<List<ToDo>> selectAllTodo() async{
    final Database db = TodoDatabase().database;
    final List<Map<String, dynamic>>  maps = await db.query('todo');
    return List.generate(maps.length,(index){
      return ToDo.fromData(
          id: maps[index]['id'],
        name: maps[index]['name']
      );
    });
  }
}