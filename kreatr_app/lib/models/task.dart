// task_model.dart

import 'dart:convert';

class Task {
  String id; // Unique timestamp ID
  String task;
  String? details;
  bool isAdded;
  bool isDone;

  Task({
    required this.id,
    required this.task,
    this.details,
    required this.isAdded,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['task'],
      details: json['details'],
      isAdded: json['isAdded'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'details': details,
      'isAdded': isAdded,
      'isDone' : isDone,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
