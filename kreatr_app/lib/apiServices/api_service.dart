import 'package:kreatr_app/data/shared_pref_helper.dart';
import 'package:kreatr_app/models/task.dart';

class ApiService {
  static Future<List<Task>> fetchTasks() async {
    // Simulating an HTTP request delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulated response data
    List<Task> taskData = await SharedPrefHelper.getTasks();
    return taskData;
  }
}
