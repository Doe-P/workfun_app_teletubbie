// server url
import 'dart:io';

import '../services/share_preferences.dart';

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
