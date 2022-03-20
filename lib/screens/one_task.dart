import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/all_tasks.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';

class OneTask extends StatelessWidget {
  final Todo todo;

  OneTask({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('one task'),
      ),
      body: TaskForm(
        todo: todo,
        conditionnel: false,
      ),
    );
  }
}
