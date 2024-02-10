import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:kreatr_app/providers/task_provider.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the TaskProvider instance using Provider.of
    final taskProvider = Provider.of<TaskProvider>(context);

    // Get the count of tasks in different states
    int totalTasks = taskProvider.taskData.length;
    int addedTasks = taskProvider.getTotalItemsInAddState();

    // Prepare data for the pie chart
    Map<String, double> dataMap = {
      'Total': totalTasks.toDouble(),
      'Added': addedTasks.toDouble(),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title of the pie chart
        const Text(
          'Task Stats',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        // Pie chart widget
        PieChart(
          dataMap: dataMap,
          chartRadius: MediaQuery.of(context).size.width / 3.5,
          chartType: ChartType.disc,
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
            showChartValues: true,
          ),
          colorList: const [
            Colors.blue,
            Colors.green,
          ],
        ),
        const SizedBox(height: 20),
        // Display total tasks count
        Text('Total Tasks: $totalTasks'),
      ],
    );
  }
}
