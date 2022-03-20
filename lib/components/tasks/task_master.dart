import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/components/tasks/task_preview.dart';

class TaskMaster extends StatelessWidget {
  final List<Todo> tasks;
  final void Function(Todo todo) showDetails;
  TaskMaster({required this.tasks, required this.showDetails});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: tasks.map((Todo todo) {
          onTaskselected() {
            showDetails(todo);
          }

          return TaskPreview(todo: todo, onTaskselected: onTaskselected);
        }).toList(),
      ),
    );
  }
}
