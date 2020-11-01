import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/settingsScreen/settingsScreen.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/constants/texts.dart';
import 'package:timer/utils/constants/colors.dart' as colors;
import 'package:timer/utils/reusableWidgets/customButton.dart';
import 'package:timer/utils/reusableWidgets/customPlainText.dart';

class TimerViewModel {
  //Method invoked when user confirms stopping the timer.
  confirmStoppingTimer() {
    Get.find<TrainingController>().intervalAndBreakTimesList.value = [];
    Get.find<TrainingController>().roundNumbersList.value = [];
    Get.offAll(Settings());
  }

  //Method invoked when user cancels stopping the timer.
  declineStoppingTimer() {
    Get.back();
    Get.find<TrainingController>().icon.value = Icons.pause;
    startTimer();
  }

  //Method invoked when user wants to pause or resume the timer.
  playPauseTimer() {
    if (Get.find<TrainingController>().timer != null) {
      if (Get.find<TrainingController>().timer.isActive) {
        Get.find<TrainingController>().timer.cancel();
        Get.find<TrainingController>().icon.value = Icons.play_arrow;
      } else {
        startTimer();
      }
    } else {
      startTimer();
    }
  }

  //Main method of the app. The most important logic is in this method which
  //defines the count down process.
  startTimer() {
    Get.find<TrainingController>().icon.value = Icons.pause;
    Get.find<TrainingController>().timer =
        Timer.periodic(Duration(seconds: 1), (timer) {
      var seconds = Get.find<TrainingController>()
          .intervalAndBreakTimesList[0]
          .split(Texts.colonChar)[1];
      var minutes = Get.find<TrainingController>()
          .intervalAndBreakTimesList[0]
          .split(Texts.colonChar)[0];

      if (int.parse(seconds) > 0) {
        //If there are sconds left, timer continues to count down
        if (int.parse(seconds) < 11) {
          //Formatting time according to seconds left. If seconds are less than 10,
          //then extra 0 is inserted to achieve ex.'XX:08' format
          //and time is decreased by one second.
          Get.find<TrainingController>().intervalAndBreakTimesList[0] =
              minutes +
                  Texts.colonChar +
                  Texts.zero +
                  (int.parse(seconds) - 1).toString();
        } else {
          //If seconds are greater than 10, then time is shown as it is.
          Get.find<TrainingController>().intervalAndBreakTimesList[0] =
              minutes + Texts.colonChar + (int.parse(seconds) - 1).toString();
        }
      } else {
        //If there are no sconds left, then minutes are checked.
        if (int.parse(minutes) > 0) {
          //If there are minutes left, then seconds are set to 60.
          seconds = '60';
          if (int.parse(minutes) < 11) {
            //Formatting time according to minutes left. If minutes are less than 10,
            //then extra 0 is inserted to achieve ex.'02:XX' format
            //and time is decreased by one minute.
            Get.find<TrainingController>().intervalAndBreakTimesList[0] =
                Texts.zero +
                    (int.parse(minutes) - 1).toString() +
                    Texts.colonChar +
                    seconds;
          } else {
            //If minutes are greater than 10, then time is shown as it is.
            Get.find<TrainingController>().intervalAndBreakTimesList[0] =
                (int.parse(minutes) - 1).toString() + Texts.colonChar + seconds;
          }
        } else {
          //If there are no sconds and minutes left, the timer is canceled.
          timer.cancel();
          if (Get.find<TrainingController>().roundNumbersList.length >= 1) {
            //Increasing round number in order to show user in which round/training intverk he/she is in,
            //if there are rounds left.
            Get.find<TrainingController>().rounds.value++;
          }
          if (Get.find<TrainingController>().rounds.value.isOdd) {
            //Setting the string which is showing to user in which interval he/she is (breal or training interval).
            //If round number is odd (1, 3, 5...), that means that user is in training interval
            //and that is what is shown to the user.
            Get.find<TrainingController>().stateIndicator.value = Texts.round
                    .toUpperCase() +
                Texts.blankSpace +
                Get.find<TrainingController>().roundNumbersList[0].toString();
          } else if (Get.find<TrainingController>().rounds.value.isEven) {
            //If round number is even (2, 4, 6...), that means that user is in break interval
            //and that is what is shown to the user.
            Get.find<TrainingController>().stateIndicator.value =
                Texts.breakText.toUpperCase();
          }
          //Updating list in order to pass right values (values for next interval)
          //to the timer when one interval is finished.
          Get.find<TrainingController>().intervalAndBreakTimesList.removeAt(0);
          if (Get.find<TrainingController>().stateIndicator.value ==
              Texts.breakText.toUpperCase()) {
            Get.find<TrainingController>().roundNumbersList.removeAt(0);
          }
          if (Get.find<TrainingController>().intervalAndBreakTimesList.length >
              0) {
            //If intervals durations list (list of intervals durations sorted in following order:
            //training interval duration, break interval duration, trainnig interval duration...)
            //is not emppty, then timer starts again with following interval duration.
            startTimer();
          } else {
            //If intervals durations list (list of intervals durations sorted in following order:
            //training interval duration, break interval duration, trainnig interval duration...)
            //is emppty, then timer stop and training session is completed.
            Get.find<TrainingController>().icon.value = Icons.play_arrow;
            Get.find<TrainingController>().stateIndicator.value =
                Texts.finish.toUpperCase();
            Get.defaultDialog(
              backgroundColor: colors.Colors.darkGrey,
              title: Texts.congratulations.toUpperCase(),
              titleStyle: GoogleFonts.roboto(
                fontSize: Get.height * FontSizes.font30,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
              content: Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: customPlainText(
                  Texts.youHaveCompletedTraining,
                  fontWeight: FontWeight.w400,
                  upperCase: false,
                ),
              ),
              barrierDismissible: false,
              confirm: customButton(
                0.06,
                0.2,
                customPlainText(Texts.ok),
                TimerViewModel().finishTraining,
              ),
            );
          }
        }
      }
    });
  }

  //Medthod invoked when users clicks on button for stopping the timer.
  stopTimer() {
    if (Get.find<TrainingController>().timer != null) {
      Get.find<TrainingController>().timer.cancel();
      Get.find<TrainingController>().icon.value = Icons.play_arrow;
      Get.defaultDialog(
        backgroundColor: colors.Colors.darkGrey,
        title: Texts.areYouSureTitle.toUpperCase() + Texts.questionMark,
        titleStyle: GoogleFonts.roboto(
          fontSize: Get.height * FontSizes.font30,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          color: colors.Colors.white,
        ),
        content: Padding(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: customPlainText(
            Texts.stoppingTimerText + Texts.newLine + Texts.doYouWantToLeave,
            fontWeight: FontWeight.w400,
            upperCase: false,
          ),
        ),
        barrierDismissible: false,
        confirm: customButton(
          0.06,
          0.2,
          customPlainText(Texts.yes),
          confirmStoppingTimer,
        ),
        cancel: customButton(
          0.06,
          0.2,
          customPlainText(Texts.no),
          declineStoppingTimer,
        ),
      );
    }
  }

  //Method invoked when user click 'OK' button in dialog box showed when
  //training session is completes.
  finishTraining() {
    Get.offAll(Settings());
  }
}
