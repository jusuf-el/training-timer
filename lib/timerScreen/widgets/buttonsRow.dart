import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/timerScreen/viewModel/timerViewModel.dart';
import 'package:timer/timerScreen/widgets/iconWidget.dart';
import 'package:timer/utils/reusableWidgets/customButton.dart';

Widget buttonsRow() {
  return Padding(
    padding: EdgeInsets.only(
      left: Get.width * 0.085,
      right: Get.width * 0.085,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customButton(
          0.1,
          0.35,
          iconWidget(),
          TimerViewModel().playPauseTimer,
        ),
        customButton(
          0.1,
          0.35,
          iconWidget(icon: Icons.stop),
          TimerViewModel().stopTimer,
        ),
      ],
    ),
  );
}
