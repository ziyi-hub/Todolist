import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'data/tasks.dart';
import 'screens/all_tasks.dart';
import 'screens/one_task.dart';
import 'screens/create_task.dart';
import 'package:todolist/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'components/tasks/task_form.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:dio/dio.dart';
import 'package:built_value/built_value.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) =>
            TasksCollection(), // designed Model is provided to the desired widgets
        child: TodoList(),
      ),
    );

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo list',
      home: Scaffold(
        body: AllTasks(
          tasks: TasksCollection().Task.tasks,
          callBack: (Todo todo) {},
        ),
      ),
      // When navigating to the "/" route, build the SignIn widget.
      initialRoute: '/inscription',
      routes: {
        // When navigating to the "/all_tasks" route, build the all_tasks widget.
        '/all_tasks': (context) => AllTasks(
              tasks: TasksCollection().Task.tasks,
              callBack: (Todo todo) {},
            ),
        // When navigating to the "/one_task" route, build the one_task widget.
        '/one_task': (context) => OneTask(
              todo: data.Tasks().tasks[0],
            ),
        // When navigating to the "/create_task" route, build the create_task widget.
        '/create_task': (context) => CreateTask(
              todo: data.Tasks().tasks[0],
            ),
        // When navigating to the "/inscription" route, build the SignUp widget.
        '/inscription': (context) => Inscription(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/connexion': (context) => Connexion(),
      },
    );
  }
}
