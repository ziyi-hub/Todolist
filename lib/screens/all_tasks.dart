import 'package:flutter/semantics.dart';
import 'package:todolist/screens/create_task.dart';
//import 'package:todolist/data/tasks.dart' as data;
import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatefulWidget {
  final void Function(Todo todo) callBack;
  final List<Todo> tasks;
  AllTasks({required this.tasks, required this.callBack});
  @override
  _AllTasks createState() => new _AllTasks(tasks: tasks);
}

class _AllTasks extends State<AllTasks> {
  //static data.Tasks Task = data.Tasks();
  final List<Todo> tasks;
  _AllTasks({required this.tasks});
  var _todo = null;
  void showDetails(todo) {
    setState(() {
      if (widget.callBack != null) {
        widget.callBack(todo);
        print(todo.content);
        _todo = todo;
      }
    });
  }

  void taskDelete(todo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Are you sure you want to delete it ?"),
        action: SnackBarAction(
            label: "yes",
            onPressed: () {
              tasks.remove(todo);
              setState(() {
                _todo = null;
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'All Tasks',
          style: TextStyle(fontFamily: 'AlexBrush'),
        ),
      ),
      body: SingleChildScrollView(
        child: (() {
          if (_todo != null) {
            return ListBody(
              mainAxis: Axis.vertical,
              reverse: false,
              children: [
                Consumer<TasksCollection>(
                  builder: (context, func, child) => Container(
                    child: TaskDetails(
                      todo: _todo,
                      taskDelete: taskDelete,
                      taskUpdate: func.updateTasks,
                    ),
                  ),
                ),
                Consumer<TasksCollection>(
                  builder: (context, func, child) => Container(
                    height: 1000,
                    child: TaskMaster(tasks: tasks, showDetails: showDetails),
                  ),
                ),
              ],
            );
          } else if (_todo == null) {
            return Consumer<TasksCollection>(
              builder: (context, cart, child) => ListBody(
                mainAxis: Axis.vertical,
                reverse: false,
                children: [
                  Container(
                    height: 1000,
                    child: TaskMaster(tasks: tasks, showDetails: showDetails),
                  ),
                ],
              ),
            );
          }
        }()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateTask(todo: tasks[0]);
              },
            ),
          );
          //Navigator.pushNamed(context, '/create_task');
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
