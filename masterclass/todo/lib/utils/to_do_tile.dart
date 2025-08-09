import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.done,
    required this.onChanged,
    required this.deleteTask,
  });

  final String taskName;
  final bool done;
  final Function(bool?)? onChanged;
  final Function(BuildContext) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Checkbox(value: done, onChanged: onChanged),

              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20,
                  decoration: done ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
