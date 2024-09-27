

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappstatenotifier/models/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo>todos =[];
  
  void addTodo(String desc){
    todos.add(Todo.add(decs: desc));
    notifyListeners();
  }

  void toffleTodo(String id){
    final todo = todos.firstWhere((todo)=> todo.id == id);

    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id){
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void updateTodo(String id,String desc){
    final todo = todos.firstWhere((todo) => todo.id == id);

    todo.decs = desc;

    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosProvider>((ref) {
  return TodosProvider();
});