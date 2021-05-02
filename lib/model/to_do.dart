class ToDo {
  int _id;
  String _name;
  ToDo.fromData({int id, String name}){
    this._id = id;
    this._name = name;
  }
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  Map<String, dynamic> toMap(){
    return {
      'id': _id,
      'name': _name
    };
  }
}