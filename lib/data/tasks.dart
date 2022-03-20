import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class Tasks extends StatefulWidget {
  final tasks = new List<Todo>.generate(
      15,
      (i) => Todo(i, random.boolean(), faker.lorem.sentence(),
          faker.date.dateTime(minYear: 2000, maxYear: 2020)));

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
