import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

Future<Widget>? focusDisable(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  return null;
}


labelText(String text, {Color color = blackColor}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 15, 10, 5),
    child: Text(
      text,
      style: notosansFont(fontColor: blackColor, fontWieght: FontWeight.w600),
    ),
  );
}


Widget heightBox(double height) {
  return SizedBox(height: height);
}

Widget widthBox(double width) {
  return SizedBox(width: width);
}