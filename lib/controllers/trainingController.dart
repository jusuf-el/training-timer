import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:timer/utils/constants/endpoints.dart';
import 'package:timer/utils/constants/texts.dart';

class TrainingController extends GetxController {
  var numberOfIntervals = Texts.emptyString.obs;
  var numberOfBreaks = Texts.emptyString.obs;
  var intervalDurationTime = Texts.emptyString.obs;
  var breakDurationTime = Texts.emptyString.obs;
  Timer timer;
  var icon = Icons.play_arrow.obs;
  var intervalAndBreakTimesList = [].obs;
  var roundNumbersList = [].obs;
  var stateIndicator = (Texts.round + Texts.blankSpace + Texts.one).obs;
  var rounds = 1.obs;
  var quoteOfTheDay = Texts.emptyString.obs;

  setNumberOfIntervals(var input) {
    numberOfIntervals.value = input;
    numberOfBreaks.value = (int.parse(input) - 1).toString();
  }

  setIntervalDuration(var input) {
    intervalDurationTime.value = input;
  }

  setBreakDuration(var input) {
    breakDurationTime.value = input;
  }

  getQuoteOfTheDay() async {
    await http.get(Endpoints.quoteOfDay).then((response) {
      quoteOfTheDay.value = response.body;
    });
  }

  @override
  void onInit() {
    getQuoteOfTheDay();
  }
}
