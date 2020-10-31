import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/utils/constants/colors.dart' as colors;

Widget customTextField(FocusNode focusNode, Function onChanged) {
  return Container(
    width: Get.height * 0.08,
    height: Get.height * 0.06,
    child: TextFormField(
      textAlign: TextAlign.center,
      style: TextStyle(
        color: colors.Colors.black,
      ),
      focusNode: focusNode,
      onChanged: (input) {
        onChanged(input);
      },
      decoration: InputDecoration(
        fillColor: colors.Colors.green,
        filled: true,
        contentPadding: EdgeInsets.all(Get.height * 0.01),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(
            color: colors.Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(
            color: colors.Colors.green,
            width: 1.0,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}
