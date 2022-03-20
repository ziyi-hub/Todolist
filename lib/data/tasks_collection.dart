import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/data/tasks.dart' as data;

class TasksCollection extends ChangeNotifier {
  final data.Tasks Task = data.Tasks();

  void addTasks(id, completed, content) {
    if (completed.text == "true") {
      final task = Todo(id, true, content, DateTime.now());
      Task.tasks.add(task);
    } else {
      final task = Todo(id, false, content, DateTime.now());
      Task.tasks.add(task);
    }

    notifyListeners();
  }

  void deleteTasks(Todo task) {
    Task.tasks.remove(task);
    notifyListeners();
  }

  void updateTasks(todo, completed, content) {
    todo.content = content.text;
    if (completed.text == "true") {
      todo.completed = true;
    } else {
      todo.completed = false;
    }
    todo.createdAt = DateTime.now();
    notifyListeners();
  }
}
