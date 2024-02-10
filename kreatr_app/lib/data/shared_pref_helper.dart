import 'dart:convert';
import 'package:kreatr_app/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String keyTasks = 'tasks';

  // Save the list of Task objects to SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> tasksMapList = tasks.map((task) => task.toJson()).toList();

    String tasksJson = json.encode(tasksMapList);

    prefs.setString(keyTasks, tasksJson);
  }

  // Retrieve the list of Task objects from SharedPreferences
  static Future<List<Task>> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? tasksJson = prefs.getString(keyTasks);

    if (tasksJson != null) {
      List<dynamic> tasksList = json.decode(tasksJson);

      List<Task> tasks = tasksList.map((item) => Task.fromJson(item)).toList();

      return tasks;
    } else {
      return [];
    }
  }
}
