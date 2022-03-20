import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatelessWidget {
  final Todo todo;
  final Function onTaskselected;
  TaskPreview({required this.todo, required this.onTaskselected});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      ListTile(
        leading: Icon(todo.completed == true
            ? Icons.check_box
            : Icons.check_box_outline_blank),
        title: Text(todo.content,
            style: TextStyle(
              decoration: todo.completed == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: todo.completed == true ? Colors.grey : Colors.black,
            )),
        trailing: Text(
          todo.completed == true ? ' done' : ' to do',
        ),
        onTap: () {
          onTaskselected();
        },
      )
    ]));
  }
}
