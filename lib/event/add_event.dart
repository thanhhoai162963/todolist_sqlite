import 'package:demo_to_do_list/base/base_event.dart';

class AddEvent extends BaseEvent{
  String info;

  AddEvent(this.info);
}