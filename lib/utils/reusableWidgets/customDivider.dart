import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

Widget customDivider() {
  return Padding(
    padding: EdgeInsets.only(
      left: Get.width * 0.106,
      right: Get.width * 0.106,
    ),
    child: Divider(
      thickness: 1.0,
      color: colors.Colors.grey,
    ),
  );
}
