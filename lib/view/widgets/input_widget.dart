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
      hintStyle: notosansFont(fontSize: 16, fontColor: grayColor),
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
      errorStyle:
          notosansFont(fontColor: redColor, fontWieght: FontWeight.w600));

          
}

inputPassword(String hint, String? isEmpty, Function()? function, bool isShow,
    {double radius = 50, bool showPrefix = false}) {
  return InputDecoration(
    filled: true,
    fillColor: grayColorLight,
    isDense: true,
    hintText: hint,
    prefix: showPrefix
        ? const Icon(
            Icons.lock,
            size: 18,
            color: grayColor,
          )
        : null,
    suffixIcon: IconButton(
        onPressed: function,
        icon: isShow
            ? Icon(
                Icons.visibility,
                color: Colors.grey.shade600,
              )
            : Icon(
                Icons.visibility_off,
                color: Colors.grey.shade600,
                size: 24,
              )),
    hintStyle: styleOption(fontSize: 18, color: grayColor.withOpacity(.3)),
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: grayColor, width: 2),
      borderRadius: BorderRadius.circular(radius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: grayColor.withOpacity(0.3), width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(.6), width: 2),
      borderRadius: BorderRadius.circular(radius),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.withOpacity(.3), width: 2),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.withOpacity(.9), width: 2),
      borderRadius: BorderRadius.circular(radius),
    ),
    errorText: isEmpty,
  );
}

