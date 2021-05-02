import 'dart:math';

import 'package:demo_to_do_list/bloc/bloc_to_do_list.dart';
import 'package:demo_to_do_list/event/add_event.dart';
import 'package:demo_to_do_list/model/to_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlocToDo>(
      builder: (context,bloc,child){
        return  Container(
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        labelText: 'Mời nhập',
                        hintText: 'Input list',
                        prefixIcon: Icon(Icons.add),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )),
                  )),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  bloc.event.add(AddEvent(textEditingController.text));
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.add),
              )
            ],
          ),
        );
      },
    );
  }
}
