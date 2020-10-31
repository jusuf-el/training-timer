import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:timer/settingsScreen/viewModel/settingsViewModel.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/constants/texts.dart';
import 'package:timer/utils/reusableWidgets/customPlainText.dart';
import 'package:timer/utils/reusableWidgets/customButton.dart';
import 'package:timer/utils/reusableWidgets/customDivider.dart';
import 'package:timer/utils/reusableWidgets/customTextField.dart';
import 'package:timer/utils/reusableWidgets/quoteWidget.dart';

class Settings extends StatelessWidget {
  final FocusNode numberOfIntervalsNode = new FocusNode();
  final FocusNode intervalDurationNode = new FocusNode();
  final FocusNode breakDurationNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('MINIMIZEEEEE');
        MinimizeApp.minimizeApp();
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => SettingsViewModel().dismissKeyboard(context),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.only(top: Get.height * 0.06),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  customPlainText(
                    Texts.training + Texts.newLine + Texts.parameters,
                    fontSize: FontSizes.font48,
                    fontWeight: FontWeight.w400,
                    upperCase: false,
                    roboto: false,
                  ),
                  SizedBox(height: Get.height * 0.021),
                  customDivider(),
                  SizedBox(height: Get.height * 0.046),
                  customPlainText(
                    Texts.numberOfIntervals,
                    fontWeight: FontWeight.w400,
                    upperCase: false,
                  ),
                  SizedBox(height: Get.height * 0.032),
                  customTextField(
                    numberOfIntervalsNode,
                    Get.find<TrainingController>().setNumberOfIntervals,
                  ),
                  SizedBox(height: Get.height * 0.032),
                  customPlainText(
                    Texts.intervalDurationInSeconds,
                    fontWeight: FontWeight.w400,
                    upperCase: false,
                  ),
                  SizedBox(height: Get.height * 0.032),
                  customTextField(
                    intervalDurationNode,
                    Get.find<TrainingController>().setIntervalDuration,
                  ),
                  SizedBox(height: Get.height * 0.032),
                  customPlainText(
                    Texts.breakDurationInSeconds,
                    fontWeight: FontWeight.w400,
                    upperCase: false,
                  ),
                  SizedBox(height: Get.height * 0.032),
                  customTextField(
                    breakDurationNode,
                    Get.find<TrainingController>().setBreakDuration,
                  ),
                  SizedBox(height: Get.height * 0.043),
                  customButton(
                    0.063,
                    0.516,
                    customPlainText(Texts.startTraining),
                    SettingsViewModel().startTraining,
                    context: context,
                  ),
                  SizedBox(height: Get.height * 0.031),
                  customDivider(),
                  SizedBox(height: Get.height * 0.012),
                  quoteWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
