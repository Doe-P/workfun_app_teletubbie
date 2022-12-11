import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../help_api.dart';

class ProfileApi {
  //TODO: get user profile data

  static Future<http.Response> getProfileApi() async {
    Uri url = Uri.parse('$endPoint/me');

    http.Response _response;
    final header = await headers();

    try {
      _response =
          await http.get(url, headers: header).timeout(Duration(seconds: 60));
    } catch (e) {
      _response = BaseApi.noResponse();
    }
    return Future.value(_response);
  }
}
