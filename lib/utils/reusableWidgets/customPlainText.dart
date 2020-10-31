import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/utils/constants/fontSizes.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

Widget customPlainText(
  String text, {
  TextAlign textAlign = TextAlign.center,
  double fontSize = FontSizes.font24,
  FontWeight fontWeight = FontWeight.w700,
  FontStyle fontStyle = FontStyle.normal,
  Color color = colors.Colors.white,
  bool upperCase = true,
  bool roboto = true,
}) {
  return Text(
    upperCase ? text.toUpperCase() : text,
    textAlign: textAlign,
    style: roboto
        ? GoogleFonts.roboto(
            fontSize: Get.height * fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            color: color,
          )
        : GoogleFonts.gruppo(
            fontSize: Get.height * fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            color: color,
          ),
  );
}
