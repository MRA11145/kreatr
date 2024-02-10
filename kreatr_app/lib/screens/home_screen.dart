import 'package:flutter/material.dart';
import 'package:kreatr_app/constants/strings_constants.dart';
import 'package:kreatr_app/helperWidgets/stats_widget.dart';
import 'package:kreatr_app/helperWidgets/task_card.dart';
import 'package:kreatr_app/models/task.dart';
import 'package:kreatr_app/utils/common_widgets.dart';
import 'package:kreatr_app/utils/media_query.dart';
import 'package:kreatr_app/utils/screen_trans.dart';

import '../apiServices/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Callback function for handling next button press
  void handleNextButton() {
    Navigator.push(context, ScreenTrans.detailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonWidgets.FontWidget(
          StringConstants.homeTile,
          Colors.black,
          FontWeight.w500,
          "inter",
          FontStyle.normal,
          80,
          TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQueryUtil.getDefaultHeightDim(250)),
            child: FutureBuilder<List<Task>>(
              future: ApiService.fetchTasks(), // Fetch tasks from API
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(StringConstants.genericError),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var task = snapshot.data![index];
                      return TaskCard(
                        task: task,
                      );
                    },
                  );
                }
              },
            ),
          ),
          StatsWidget(checkStats: handleNextButton), // Display stats widget
        ],
      ),
    );
  }
}
