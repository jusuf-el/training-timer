import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/trainingController.dart';

Widget iconWidget({IconData icon}) {
  return icon == null
      ? Obx(() {
          return Icon(
            Get.find<TrainingController>().icon.value,
            size: Get.height * 0.05,
          );
        })
      : Icon(
          icon,
          size: Get.height * 0.05,
        );
}
