import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> tasks = [];
  final String dbUrl = "https://teste-1c701-default-rtdb.firebaseio.com/";

  Future<void> save(Task task) async {
    if (task.id == null) {
      add(task);
    } else {
      update(task);
    }
  }

  Future<void> add(Task task) async {
    final response = await http.post(Uri.parse("$dbUrl/tasks.json"),
        body: jsonEncode({
          'title': task.title,
          'category': task.category,
          'description': task.description,
          'date': task.date.toIso8601String(),
        }));

    final body = jsonDecode(response.body);

    tasks.add(Task(
      id: body['name'],
      category: task.category,
      title: task.title,
      description: task.description,
      date: task.date,
    ));
    notifyListeners();
  }

  Future<void> update(Task task) async {
    final response = await http.patch(Uri.parse("$dbUrl/tasks/${task.id}.json"),
        body: jsonEncode({
          'title': task.title,
          'description': task.description,
          'date': task.date.toIso8601String(),
        }));

    int index = tasks.indexWhere((task) => task.id == task.id);
    tasks[index] = task;

    notifyListeners();
  }

  Future<void> delete(Task task) async {
    http.delete(Uri.parse("$dbUrl/tasks/${task.id}.json"));
    tasks.remove(task);
  }

  Future<void> load() async {
    tasks.clear();
    final response = await http.get(Uri.parse("$dbUrl/tasks.json"));
    final Map<String, dynamic>? body = jsonDecode(response.body);
    debugPrint(body.toString());

    if (body!.isNotEmpty) {
      body!.forEach((key, value) {
        Task task = Task(
            id: key,
            category: value["category"],
            title: value['title'],
            description: value['description'],
            date: DateTime.parse(value['date']));
        tasks.add(task);
      });
    }

    notifyListeners();
  }
}
