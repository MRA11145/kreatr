import 'package:flutter/material.dart';
import 'package:kreatr_app/constants/strings_constants.dart';
import 'package:kreatr_app/models/task.dart';
import 'package:kreatr_app/providers/task_provider.dart';
import 'package:kreatr_app/screens/task_details_screen.dart';
import 'package:kreatr_app/utils/common_widgets.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final bool showDetails;

  const TaskCard({
    Key? key,
    required this.task,
    this.showDetails = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display task name
                CommonWidgets.FontWidget(
                  task.task,
                  Colors.black,
                  FontWeight.bold,
                  "Inter",
                  FontStyle.normal,
                  80,
                ),
                const SizedBox(height: 8),
                // Display task details if showDetails is true
                if (showDetails)
                  CommonWidgets.FontWidget(
                    task.details ?? StringConstants.noDeatils,
                    Colors.black,
                    FontWeight.bold,
                    "Inter",
                    FontStyle.normal,
                    50,
                  ),
                const SizedBox(height: 16),
                // Widget containing task options
                getOptionsWidget(context, taskProvider),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Widget to display task options (Add, Remove, Details)
  Widget getOptionsWidget(BuildContext context, TaskProvider taskProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Button to add task
        if (!task.isAdded)
          ElevatedButton(
            onPressed: () {
              taskProvider.addTask(task);
            },
            child: CommonWidgets.FontWidget(
              StringConstants.add,
              Colors.black,
              FontWeight.bold,
              "Inter",
              FontStyle.normal,
              40,
            ),
          ),
        // Button to remove task if showDetails is false and task is added
        if (!showDetails && task.isAdded)
          ElevatedButton(
            onPressed: () {
              taskProvider.removeTask(task);
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: CommonWidgets.FontWidget(
              StringConstants.remove,
              Colors.black,
              FontWeight.bold,
              "Inter",
              FontStyle.normal,
              40,
            ),
          ),
        // Button to navigate to task details screen
        if (!showDetails)
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailsScreen(task: task),
                ),
              );
            },
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
      ],
    );
  }
}
