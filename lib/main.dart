import 'package:flutter/material.dart';
import 'package:timer/settingsScreen/settingsScreen.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/texts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(TrainingController());
    return GetMaterialApp(
      title: Texts.trainingTimre,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Settings(),
    );
  }
}
