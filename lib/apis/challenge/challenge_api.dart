
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:workfun_app_teletubbie/apis/base_api.dart';
import 'package:workfun_app_teletubbie/apis/help_api.dart';
class ChallangeApi{
  // create a new challange
  static Future<http.Response> createChallange(final body) async {
    final String url = "$endPoint/challenge";
    final header = await headers(isJson: true);
    http.Response response;
    try {
      response = await http
          .post(Uri.parse(url), headers: header, body: jsonEncode(body))
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }
}