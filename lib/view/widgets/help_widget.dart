import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../style/text_style.dart';

Widget heightBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget widthBox(double width) {
  return SizedBox(
    width: width,
  );
}

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

Widget title(
  String txt1,
  String txt2,
  VoidCallback onTap,
) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 250),
              child: Text(
                txt1,
                style: styleOption(
                    fontSize: 18,
                    color: blackColor.withOpacity(.6),
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          txt2,
          style: styleOption(fontSize: 14, color: blackColor.withOpacity(.6)),
        ),
      ),
    ],
  );
}

Widget materialbutton(double minWid, Function()? function, String txt,
    {double borderRadius = 20,
    Color txtColor = whiteColor,
    Color btnColor = yellowColor}) {
  return Material(
    shadowColor: blackColor.withOpacity(0.5),
    elevation: 0.0,
    color: btnColor,
    borderRadius: BorderRadius.circular(borderRadius),
    child: MaterialButton(
      minWidth: minWid,
      padding: const EdgeInsets.all(10),
      onPressed: function,
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: styleOption(fontSize: 18, color: txtColor),
      ),
    ),
  );
}
