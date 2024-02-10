import 'package:flutter/material.dart';
import 'package:kreatr_app/helperWidgets/pie_chart.dart';
import 'package:kreatr_app/helperWidgets/task_card.dart';
import 'package:kreatr_app/models/task.dart';
import 'package:kreatr_app/providers/task_provider.dart';
import 'package:kreatr_app/utils/media_query.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key});
  static const routeName = "/deails";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
      ),
      body: Consumer<TaskProvider>(builder: (context, taskProvider, _) {
        List<Task> taskData = taskProvider.getAllTask(); // Update to get all tasks
        return Stack(
          children: [
            const PieChartWidget(),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQueryUtil.getDefaultHeightDim(250), top: MediaQueryUtil.getDefaultHeightDim(750)),
              child: ListView.builder(
                itemCount: taskData.length,
                itemBuilder: (context, index) {
                  var task = taskData[index];
                  return TaskCard(
                    task: task,
                    showDetails: true,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQueryUtil.getDefaultHeightDim(200)),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQueryUtil.getDefaultWidthDim(60),
                    ),
                    // Placeholder for total stats display
                    Expanded(child: Container()),
                    SizedBox(
                      width: MediaQueryUtil.getDefaultWidthDim(60),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
