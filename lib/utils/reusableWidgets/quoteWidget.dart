import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/controllers/trainingController.dart';
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/constants/texts.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

Widget quoteWidget() {
  return Column(
    children: [
      Text(
        Texts.quoteOfDay + Texts.colonChar,
        style: GoogleFonts.roboto(
          fontSize: Get.height * FontSizes.font24,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          color: colors.Colors.white,
        ),
      ),
      SizedBox(height: Get.height * 0.02),
      Obx(() {
        return Text(
          Get.find<TrainingController>().quoteOfTheDay.value,
          style: GoogleFonts.gruppo(
            fontSize: Get.height * FontSizes.font30,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: colors.Colors.white,
          ),
        );
      }),
    ],
  );
}
