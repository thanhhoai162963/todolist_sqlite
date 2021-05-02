import 'package:demo_to_do_list/to_do_list/header.dart';
import 'package:demo_to_do_list/to_do_list/list_result.dart';
import 'package:flutter/material.dart';

class ToDoContainer extends StatefulWidget {
  @override
  _ToDoContainerState createState() => _ToDoContainerState();
}

class _ToDoContainerState extends State<ToDoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Header(),
          SizedBox(height: 40),
          ListResult(),
        ],
      ),
    );
  }
}
