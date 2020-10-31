import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

Widget customButton(
  double height,
  double width,
  Widget child,
  Function onPressed, {
  BuildContext context,
}) {
  return Container(
    height: Get.height * height,
    width: Get.width * width,
    child: RaisedButton(
      color: colors.Colors.green,
      onPressed: () {
        if (context == null) {
          onPressed();
        } else {
          onPressed(context);
        }
      },
      child: child,
    ),
  );
}
