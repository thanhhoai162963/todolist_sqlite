import 'package:demo_to_do_list/bloc/bloc_to_do_list.dart';
import 'package:demo_to_do_list/event/delete_event.dart';
import 'package:demo_to_do_list/model/to_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListResult extends StatefulWidget {
  @override
  _ListResultState createState() => _ListResultState();
}

class _ListResultState extends State<ListResult> {
  @override
  void didChangeDependencies() {
    var bloc = Provider.of<BlocToDo>(context);
    bloc.initData();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocToDo>(builder: (context, bloc, child) {
      return StreamBuilder<List<ToDo>>(
          initialData: [],
          stream: bloc.streamController.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return Container(
                  child: Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            '${'${snapshot.data[index].id}'}',
                            style: TextStyle(color: Colors.blue),
                          ),
                          title: Text(
                            snapshot.data[index].name,
                            style: TextStyle(color: Colors.blue),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever, size: 40),
                            color: Colors.red,
                            onPressed: () {
                              bloc.event.add(DeleteEvent(snapshot.data[index]));
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: snapshot.data.length,
                    ),
                  ),
                );
              case ConnectionState.none:
              default:
                return Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          });
    });
  }
}
