import 'package:demo_to_do_list/bloc/bloc_to_do_list.dart';
import 'package:demo_to_do_list/db/todo_database.dart';
import 'package:demo_to_do_list/to_do_list/to_do_list_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("To do list"),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: Provider<BlocToDo>.value(
              value: BlocToDo(),
              child: ToDoContainer())),
    );
  }
}
