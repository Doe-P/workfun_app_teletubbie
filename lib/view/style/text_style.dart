import 'package:flutter/painting.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';


const String roboto = "roboto";
const String notosans = "NotoSansLao";


TextStyle notosansFont(
        {double fontSize = 16,
        FontWeight fontWieght = FontWeight.w300,
        Color fontColor = blackColor}) =>
    TextStyle(
      fontFamily: notosans,
      fontSize: fontSize,
      fontWeight: fontWieght,
      color: fontColor,
    );


TextStyle robotoFont(
        {double fontSize = 16,
        FontWeight fontWieght = FontWeight.w300,
        Color fontColor = blackColor}) =>
    TextStyle(
      fontFamily: roboto,
      fontSize: fontSize,
      fontWeight: fontWieght,
      color: fontColor,
    );

TextStyle styleOption(
        {double fontSize = 16,
        Color color = blackColor,
        FontWeight fontWeight = FontWeight.normal,
        String fontFamily=notosans}) =>
    TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight);