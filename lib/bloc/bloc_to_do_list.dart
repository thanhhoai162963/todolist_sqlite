import 'dart:async';

import 'package:demo_to_do_list/base/base_bloc.dart';
import 'package:demo_to_do_list/db/todo_table.dart';
import 'package:demo_to_do_list/event/add_event.dart';
import 'package:demo_to_do_list/base/base_event.dart';
import 'package:demo_to_do_list/event/delete_event.dart';
import 'package:demo_to_do_list/model/to_do.dart';
import 'dart:math';
class BlocToDo extends BaseBloc{
  ToDoTable _toDoTable = ToDoTable();
  List<ToDo> data = [];
  StreamController<List<ToDo>> _streamController = StreamController<List<ToDo>>();


  StreamController<List<ToDo>> get streamController => _streamController;



  dispose(){
    _streamController.close();
  }

  @override
  void dispatchEvent(BaseEvent event123) {
    if (event123 is AddEvent){
      ToDo toDo = ToDo.fromData(id: Random().nextInt(10),name: event123.info);
      _addToDo(toDo);
    }else if (event123 is DeleteEvent){
      _deleteToDo(event123.toDo);
    }
  }
  _addToDo(ToDo toDo) async{
    await _toDoTable.insertTodo(toDo);
    data.add(toDo);
    _streamController.sink.add(data);
  }
  _deleteToDo(ToDo toDo) async{
    await _toDoTable.deleteTodo(toDo);
    data.remove(toDo);
    _streamController.sink.add(data);
  }
  initData() async{
    data =  await _toDoTable.selectAllTodo();
    if (data == null){
      return;
    }
    _streamController.sink.add(data);
  }
}