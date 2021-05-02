import 'dart:async';

import 'base_event.dart';


abstract class BaseBloc {
  StreamController<BaseEvent> _streamController = StreamController<BaseEvent>();
  Sink<BaseEvent> get event => _streamController.sink;
  BaseBloc(){
    _streamController.stream.listen((event) {
      if(event is! BaseEvent){
        throw Exception('không phải event');
      }
      dispatchEvent(event);
    });
  }
  void dispatchEvent(BaseEvent event);
  dispose(){
    _streamController.close();
  }
}