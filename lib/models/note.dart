
class Note {
  int id;
  String name;
  String age;

  Note(this.id, this.name,this.age);

  int get _id =>id;
  String get _title =>_title;
  String get _description =>_description;


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'age':age,
    };
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    age = map['age'];
  }
}