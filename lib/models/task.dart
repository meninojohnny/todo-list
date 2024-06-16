import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final DateTime date;
  final String category;

  Task( 
      {this.id,
      required this.category,
      required this.title,
      required this.description,
      required this.date});
}
