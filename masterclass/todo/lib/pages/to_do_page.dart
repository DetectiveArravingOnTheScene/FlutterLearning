import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/to_do_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _box = Hive.box("tasks");
  ToDoDatabase db = ToDoDatabase();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (_box.get("todolist") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void taskChanged(bool? val, int index) {
    if (val != null) {
      setState(() {
        db.tasks[index][1] = !db.tasks[index][1];
      });
      db.updateData();
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onCancel: () => Navigator.pop(context),
          onSave: saveNewTask,
        );
      },
    );
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.tasks.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text("To Do"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder: (context, i) {
          return ToDoTile(
            taskName: db.tasks[i][0],
            done: db.tasks[i][1],
            onChanged: (val) => taskChanged(val, i),
            deleteTask: (c) {
              deleteTask(i);
            },
          );
        },
      ),
    );
  }
}
