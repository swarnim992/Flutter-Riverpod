// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();


class Todo {

  String id;
  String decs;
  bool completed;

  Todo({
    required this.id,
    required this.decs,
    this.completed = false,
  });

  factory Todo.add({required String decs}){
    return Todo(id: uuid.v4(),decs: decs);
  }

  @override
    String toString() => 'Todo(id: $id, desc: $decs, completed: $completed)';

}
