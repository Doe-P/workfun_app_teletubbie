// server url
// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:io';
import 'package:workfun_app_teletubbie/services/share_preferences.dart';

String baseUrl = "http://157.245.158.229";

// end point
String endPoint = "$baseUrl/api";


Future headers({bool isJson = false}) async {
  final String _token = await SharePreferences.getAccessToken();
  dynamic headers;
  if (isJson) {
    headers = {
      HttpHeaders.authorizationHeader: "Bearer $_token",
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };
  } else {
    headers = {
      HttpHeaders.authorizationHeader: "Bearer $_token",
      HttpHeaders.acceptHeader: "application/json",
    //  HttpHeaders.contentTypeHeader: "application/json",
    };
  }
  return headers;
}
