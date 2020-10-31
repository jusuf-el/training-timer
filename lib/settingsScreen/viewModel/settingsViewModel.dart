import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/timerScreen/timerScreen.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/texts.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

class SettingsViewModel {
  //Method for validating user's input for number of intervals.
  //Input cannot contain minus, plus, dot, comma.
  //Input cannot be 0, 1, negative number or empty.
  bool validateNumberOfIntervals() {
    if (Get.find<TrainingController>()
        .numberOfIntervals
        .value
        .startsWith(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.numberOfIntervalsCantBeNegative,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().numberOfIntervals.value ==
        Texts.zero) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.numberOfIntervalsCantBeZero,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().numberOfIntervals.value ==
        Texts.one) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.multipleIntervals,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().numberOfIntervals.value ==
        Texts.emptyString) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.numberOfIntervalsCantBeEmpty,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>()
            .numberOfIntervals
            .value
            .toString()
            .contains(Texts.dot) ||
        Get.find<TrainingController>()
            .numberOfIntervals
            .value
            .toString()
            .contains(Texts.comma) ||
        Get.find<TrainingController>()
            .numberOfIntervals
            .value
            .toString()
            .contains(Texts.plus) ||
        Get.find<TrainingController>()
            .numberOfIntervals
            .value
            .toString()
            .contains(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.provideNumberWithoutSpecialCharsForNumberOfIntervals,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else {
      return true;
    }
  }

  //Method for validating user's input for interval duration.
  //Input cannot contain minus, plus, dot, comma.
  //Input cannot be 0, negative number or empty.
  bool validateIntervalDuration() {
    if (Get.find<TrainingController>()
        .numberOfIntervals
        .value
        .startsWith(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.intervalDurationCantBeNegative,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().intervalDurationTime.value ==
        Texts.zero) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.intervalDurationCantBeZero,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().intervalDurationTime.value ==
        Texts.emptyString) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.intervalDurationCantBeEmpty,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>()
            .intervalDurationTime
            .value
            .toString()
            .contains(Texts.dot) ||
        Get.find<TrainingController>()
            .intervalDurationTime
            .value
            .toString()
            .contains(Texts.comma) ||
        Get.find<TrainingController>()
            .intervalDurationTime
            .value
            .toString()
            .contains(Texts.plus) ||
        Get.find<TrainingController>()
            .intervalDurationTime
            .value
            .toString()
            .contains(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.provideNumberWithoutSpecialCharsForIntervalDuration,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else {
      return true;
    }
  }

  //Method for validating user's input for break duration.
  //Input cannot contain minus, plus, dot, comma.
  //Input cannot be 0, negative number or empty.
  bool validateBreakDuration() {
    if (Get.find<TrainingController>()
        .breakDurationTime
        .value
        .startsWith(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.breakDurationCantBeNegative,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().breakDurationTime.value ==
        Texts.zero) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.breakDurationCantBeZero,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>().breakDurationTime.value ==
        Texts.emptyString) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.breakDurationCantBeEmpty,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else if (Get.find<TrainingController>()
            .breakDurationTime
            .value
            .toString()
            .contains(Texts.dot) ||
        Get.find<TrainingController>()
            .breakDurationTime
            .value
            .toString()
            .contains(Texts.comma) ||
        Get.find<TrainingController>()
            .breakDurationTime
            .value
            .toString()
            .contains(Texts.plus) ||
        Get.find<TrainingController>()
            .breakDurationTime
            .value
            .toString()
            .contains(Texts.minus)) {
      Get.snackbar(
        Texts.error + Texts.exclamationMark,
        Texts.provideNumberWithoutSpecialCharsForBreakDuration,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colors.Colors.red,
        margin: EdgeInsets.all(Get.height * 0.02),
      );
      return false;
    } else {
      return true;
    }
  }

  //Method involed when user clicks on 'START TRAINING' button.
  startTraining(BuildContext context) {
    if (validateNumberOfIntervals() &&
        validateIntervalDuration() &&
        validateBreakDuration()) {
      dismissKeyboard(context);
      calculateIntervalMinutesAndSeconds();
      calculateBreakMinutesAndSeconds();
      createIntervalAndBreakTimesList();
      Get.find<TrainingController>().rounds.value = 1;
      Get.find<TrainingController>().stateIndicator.value =
          Texts.round.toUpperCase() +
              Texts.blankSpace +
              Get.find<TrainingController>().rounds.value.toString();
      Get.off(TrainingTimer());
    }
  }

  //Method for creating list of training and break intervals.
  //The list is later used for successful timer's countdown, differentiating
  //between training and break intervals.
  createIntervalAndBreakTimesList() {
    for (int i = 1;
        i <= int.parse(Get.find<TrainingController>().numberOfIntervals.value);
        i++) {
      Get.find<TrainingController>()
          .intervalAndBreakTimesList
          .add(Get.find<TrainingController>().intervalDurationTime.value);
      if (i.toString() !=
          Get.find<TrainingController>().numberOfIntervals.value) {
        Get.find<TrainingController>()
            .intervalAndBreakTimesList
            .add(Get.find<TrainingController>().breakDurationTime.value);
      }
    }
    createRoundNumbersList();
  }

  //Method for creating list of training rounds.
  //The list is later used for differentiating between training and break intervals
  //and showing the state or round to the user.
  createRoundNumbersList() {
    for (int i = 1;
        i <= int.parse(Get.find<TrainingController>().numberOfIntervals.value);
        i++) {
      Get.find<TrainingController>().roundNumbersList.add(i);
    }
  }

  //Method for calculating and formatting the time of interval out of user's input.
  calculateIntervalMinutesAndSeconds() {
    var minutes;
    var seconds;
    minutes = Duration(
            seconds: int.parse(
                Get.find<TrainingController>().intervalDurationTime.value))
        .inMinutes;
    seconds =
        int.parse(Get.find<TrainingController>().intervalDurationTime.value) -
            minutes * 60;
    if (minutes.toString().length == 1) {
      if (seconds.toString().length == 1) {
        Get.find<TrainingController>().intervalDurationTime.value = Texts.zero +
            minutes.toString() +
            Texts.colonChar +
            Texts.zero +
            seconds.toString();
      } else {
        Get.find<TrainingController>().intervalDurationTime.value = Texts.zero +
            minutes.toString() +
            Texts.colonChar +
            seconds.toString();
      }
    } else {
      if (seconds.toString().length == 1) {
        Get.find<TrainingController>().intervalDurationTime.value =
            minutes.toString() +
                Texts.colonChar +
                Texts.zero +
                seconds.toString();
      } else {
        Get.find<TrainingController>().intervalDurationTime.value =
            minutes.toString() + Texts.colonChar + seconds.toString();
      }
    }
  }

  //Method for calculating and formatting the break time out of user's input.
  calculateBreakMinutesAndSeconds() {
    var minutes;
    var seconds;
    minutes = Duration(
            seconds: int.parse(
                Get.find<TrainingController>().breakDurationTime.value))
        .inMinutes;
    seconds =
        int.parse(Get.find<TrainingController>().breakDurationTime.value) -
            minutes * 60;
    if (minutes.toString().length == 1) {
      if (seconds.toString().length == 1) {
        Get.find<TrainingController>().breakDurationTime.value = Texts.zero +
            minutes.toString() +
            Texts.colonChar +
            Texts.zero +
            seconds.toString();
      } else {
        Get.find<TrainingController>().breakDurationTime.value = Texts.zero +
            minutes.toString() +
            Texts.colonChar +
            seconds.toString();
      }
    } else {
      if (seconds.toString().length == 1) {
        Get.find<TrainingController>().breakDurationTime.value =
            minutes.toString() +
                Texts.colonChar +
                Texts.zero +
                seconds.toString();
      } else {
        Get.find<TrainingController>().breakDurationTime.value =
            minutes.toString() + Texts.colonChar + seconds.toString();
      }
    }
  }

  dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
