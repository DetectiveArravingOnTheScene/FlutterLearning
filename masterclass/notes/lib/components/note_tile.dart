import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function() onEdit;
  final void Function() onDelete;
  const NoteTile({
    super.key,
    required this.text,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
