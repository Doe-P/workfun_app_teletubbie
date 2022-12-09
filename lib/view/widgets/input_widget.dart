import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

inputTextField(String hint, String? errorMessage,
    {bool prefix = false, Widget? widget, bool subfix = false}) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: grayColorLight,
    prefixIcon: prefix ? widget : null,
    suffixIcon: subfix ? widget : null,
    hintStyle: notosansFont(fontSize: 16, fontColor: grayColorDark),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: yellowColor, width: 0.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: whiteColor, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: yellowColor, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: redColor, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: redColor, width: 2.0),
    ),
    errorText: errorMessage,
    errorStyle: notosansFont(fontColor: redColor, fontWieght: FontWeight.w600)
  );
}
