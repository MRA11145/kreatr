import 'package:flutter/material.dart';
import 'package:kreatr_app/constants/strings_constants.dart';
import 'package:kreatr_app/models/task.dart';
import 'package:kreatr_app/utils/common_widgets.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Display task name in the app bar
        title: CommonWidgets.FontWidget(
          task.task,
          Colors.white,
          FontWeight.bold,
          "Inter",
          FontStyle.normal,
          80,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title for task details
            CommonWidgets.FontWidget(
              StringConstants.details,
              Colors.black,
              FontWeight.bold,
              "Inter",
              FontStyle.normal,
              70,
            ),
            const SizedBox(height: 8),
            // Display task details or a default message if details are null
            CommonWidgets.FontWidget(
              task.details ?? StringConstants.noDeatils,
              Colors.black,
              FontWeight.normal,
              "Inter",
              FontStyle.normal,
              60,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0), // Adjust the left padding as needed
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back when the button is pressed
              },
              child: const Icon(Icons.arrow_back), // Back arrow icon
            ),
          ),
        ],
      ),
    );
  }
}
