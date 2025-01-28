import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final _box = Hive.box("calebstein_todo_box");

  List todoList = [];

  List _createInitialData() {
    return [
      ["Make tutorial", true],
      ["Exercise", false]
    ];
  }

  void loadData() {
    todoList = _box.get("TODOLIST") ?? _createInitialData();
  }

  void updateDatabase() {
    _box.put("TODOLIST", todoList);
  }
}