import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@JsonSerializable()
class Todo {
  int id;
  String content;
  bool completed;
  DateTime? createdAt;

  // Read-only non-final property
  int? get launchYear => createdAt?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Todo(this.id, this.completed, this.content, this.createdAt) {
    // Initialization code goes here.
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        content = json['content'] as String,
        completed = json['completed'] as bool,
        createdAt = json['createdAt'] == null
            ? null
            : DateTime.parse(json['dateOfBirth'] as String);

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'completed': completed,
        'createdAt': createdAt
      };

  Future<Todo> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
