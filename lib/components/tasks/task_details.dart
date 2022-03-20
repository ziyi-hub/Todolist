import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/one_task.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';

class TaskDetails extends StatelessWidget {
  final Todo todo;
  final Function taskDelete;
  final Function taskUpdate;
  TaskDetails(
      {required this.todo, required this.taskDelete, required this.taskUpdate});

  @override
  Widget build(BuildContext context) {
    return ListBody(mainAxis: Axis.vertical, reverse: false, children: [
      Container(
        height: 100,
        color: Colors.blue[50],
        child: Center(
          child: Text(
            '${todo.content}' +
                '  \n' +
                '${todo.completed == true ? ' done' : ' to do'}' +
                '  \n' +
                'created at '
                    '${todo.createdAt}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      Container(
          color: Colors.blue[50],
          child: new ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<TasksCollection>(
                  builder: (context, params, child) => ElevatedButton(
                    onPressed: () {
                      taskDelete(todo);
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Consumer<TasksCollection>(
                  builder: (context, params, child) => ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new OneTask(
                              todo: todo,
                            );
                          },
                        ),
                      );
                      //Navigator.pushNamed(context, '/create_task');
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ]))
    ]);
  }
}
