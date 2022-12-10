import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:workfun_app_teletubbie/apis/help_api.dart';
import '../base_api.dart';

class AuthApi {
  static Future<http.Response> signIn(final data) async {
    Uri url = Uri.parse('$endPoint/login');
    http.Response _response;
    try {
      _response =
          await http.post(url, body: data).timeout(Duration(seconds: 60));
    } catch (e) {
      _response = BaseApi.noResponse();
    }
    return Future.value(_response);
  }

  static Future<http.Response> signUp(final data) async {
    Uri url = Uri.parse('$endPoint/register');
    
   final header = {
      HttpHeaders.authorizationHeader: HttpHeaders.contentTypeHeader,
      HttpHeaders.acceptHeader: "application/json"
    };
    http.Response _response;
    try {
      _response = await http
          .post(url, headers: header, body: data)
          .timeout(Duration(seconds: 60));
    } catch (e) {
      _response = BaseApi.noResponse();
    }
    return Future.value(_response);
  }
}
