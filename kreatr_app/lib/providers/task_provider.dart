// ViewModel class managing the state of the task list
import 'package:flutter/material.dart';
import 'package:kreatr_app/data/shared_pref_helper.dart';
import 'package:kreatr_app/models/dummy_data.dart';
import 'package:kreatr_app/models/task.dart';

class TaskProvider extends ChangeNotifier {

  List<Task> taskData = [];

  TaskProvider() {
    load();
  }

  /// Load the old data
  Future<void> load() async {
    taskData = await SharedPrefHelper.getTasks();
    mergeData();
    notifyListeners();
  }

  // Save the current status
  Future<void> save() async {
    await SharedPrefHelper.saveTasks(taskData);
  }

  void mergeData() {
    List<Task> tempData = DummyData()
        .data
        .map((item) => Task(
              id: item['id'],
              task: item['task'],
              details: item['details'],
              isAdded: item['isAdded'],
              isDone: item['isDone'],
            ))
        .toList();
    // Get the existing task IDs
    List<String> existingIds = taskData.map((task) => task.id).toList();

    // Iterate over the tempData list
    for (Task task in tempData) {
      // Check if the task's ID is not already in the taskData
      if (!existingIds.contains(task.id)) {
        // Add the task to taskData
        taskData.add(task);
      }
    }
    save();
  }


  int getTotalItemsInAddState() {
    return taskData.where((element) => element.isAdded == true).toList().length;
  }

  // Method to add a task
  void addTask(Task task) {
    task.isAdded = true;
    for (var element in taskData) {
      if (element.id == task.id) {
        element.isAdded = true;
        break;
      }
    }
    notifyListeners();
    save();
  }


 // Method to remove a task
  void removeTask(Task task) {
    task.isAdded = false;
    for (var element in taskData) {
      if (element.id == task.id) {
        element.isAdded = false;
        break;
      }
    }
    notifyListeners();
    save();
  }

  List<Task> getAllTask() {
    return taskData.where((element) => element.isAdded == true).toList();
  }
}
