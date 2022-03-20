import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/all_tasks.dart';

class TaskForm extends StatelessWidget {
  final Todo todo;
  final bool conditionnel;
  TaskForm({required this.todo, required this.conditionnel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(todo: todo, conditionnel: conditionnel),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final Todo todo;
  final bool conditionnel;
  const MyCustomForm({required this.todo, required this.conditionnel});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(todo, conditionnel);
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final Todo todo;
  final bool conditionnel;
  final _formKey = GlobalKey<FormState>();
  TextEditingController contentController = TextEditingController();
  TextEditingController completedController = TextEditingController();

  MyCustomFormState(this.todo, this.conditionnel);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        //crossAxisAlignment: CrossAxisAlignment.start,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                  hintText: ' Ex: Faire des courses',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: completedController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Completed',
                  hintText: ' Ex: true/false',
                ),
              ),
            ),
            Consumer<TasksCollection>(
              builder: (context, params, child) => ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (conditionnel == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Are you sure update it ?"),
                          action: SnackBarAction(
                              label: "yes",
                              onPressed: () {
                                params.updateTasks(todo, completedController,
                                    contentController);
                              }),
                        ),
                      );

                      AllTasks(
                        tasks: params.Task.tasks,
                        callBack: (Todo todo) {},
                      );
                    } else {
                      params.addTasks(params.Task.tasks.length + 1,
                          completedController, contentController.text);
                      AllTasks(
                        tasks: params.Task.tasks,
                        callBack: (Todo todo) {},
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Add Success!")),
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AllTasks(
                            tasks: params.Task.tasks,
                            callBack: (Todo todo) {},
                          );
                        },
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
