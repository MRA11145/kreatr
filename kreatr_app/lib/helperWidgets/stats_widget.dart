import 'package:flutter/material.dart';
import 'package:kreatr_app/constants/strings_constants.dart';
import 'package:kreatr_app/providers/task_provider.dart';
import 'package:kreatr_app/utils/media_query.dart';
import 'package:provider/provider.dart';

import '../utils/common_widgets.dart';

class StatsWidget extends StatelessWidget {
  final VoidCallback checkStats;

  const StatsWidget({Key? key, required this.checkStats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _) {
        // Get the total number of tasks to be done
        int totalItems = taskProvider.getTotalItemsInAddState();
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQueryUtil.getValueInPixel(20),
                ),
                SizedBox(
                  width: MediaQueryUtil.getValueInPixel(20),
                ),
                // Display the number of tasks to be done
                CommonWidgets.FontWidget(
                  "Task to be Done : $totalItems",
                  Colors.black,
                  FontWeight.w700,
                  "Inter",
                  FontStyle.normal,
                  50,
                  TextAlign.left,
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    checkStats();
                  },
                  child: Container(
                    height: MediaQueryUtil.getValueInPixel(130),
                    width: MediaQueryUtil.getValueInPixel(400),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: CommonWidgets.FontWidget(
                        StringConstants.checkStats,
                        Colors.white,
                        FontWeight.w700,
                        "Inter",
                        FontStyle.normal,
                        50,
                        TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
