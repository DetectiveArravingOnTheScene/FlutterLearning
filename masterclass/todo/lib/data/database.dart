import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List tasks = [];

  final box = Hive.box("tasks");

  void createInitialData() {
    tasks = [
      ["Meow", false],
    ];
  }

  void loadData() {
    tasks = box.get('todolist');
  }

  void updateData() {
    box.put("todolist", tasks);
  }
}
