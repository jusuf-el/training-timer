import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/colors.dart' as colors;
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/reusableWidgets/customPlainText.dart';

Widget stateIndicatorBar() {
  return Container(
    width: Get.width * 1,
    height: Get.height * 0.078,
    alignment: Alignment.center,
    color: colors.Colors.green,
    child: Obx(() {
      return customPlainText(
        Get.find<TrainingController>().stateIndicator.value,
        upperCase: true,
        roboto: false,
        color: colors.Colors.lightBlack,
        fontSize: FontSizes.font48,
        fontWeight: FontWeight.w400,
      );
    }),
  );
}
