import 'package:demo_to_do_list/base/base_event.dart';
import 'package:demo_to_do_list/model/to_do.dart';

class DeleteEvent extends BaseEvent{
  ToDo toDo;

  DeleteEvent(this.toDo);
}