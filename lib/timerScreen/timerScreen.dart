import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/timerScreen/widgets/buttonsRow.dart';
import 'package:timer/timerScreen/widgets/stateIndicatorBar.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/constants/texts.dart';
import 'package:timer/utils/reusableWidgets/customDivider.dart';
import 'package:timer/utils/reusableWidgets/customPlainText.dart';
import 'package:timer/utils/reusableWidgets/quoteWidget.dart';

class TrainingTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.06),
        child: Column(
          children: [
            customDivider(),
            SizedBox(height: Get.height * 0.052),
            stateIndicatorBar(),
            SizedBox(height: Get.height * 0.095),
            Obx(() {
              return customPlainText(
                Get.find<TrainingController>()
                            .intervalAndBreakTimesList
                            .length >
                        0
                    ? Get.find<TrainingController>()
                        .intervalAndBreakTimesList[0]
                    : Texts.timerZeros,
                fontSize: FontSizes.timerFont,
                fontWeight: FontWeight.bold,
              );
            }),
            SizedBox(height: Get.height * 0.087),
            buttonsRow(),
            SizedBox(height: Get.height * 0.138),
            customDivider(),
            SizedBox(height: Get.height * 0.012),
            quoteWidget(),
          ],
        ),
      ),
    );
  }
}
