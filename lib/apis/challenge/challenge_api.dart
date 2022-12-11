import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../help_api.dart';

class ChallengeApi {
  static Future<http.Response> getChellengeApi(
      Map<String, String> queryParams) async {
    final String url = "$endPoint/challenge";
    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl = url + "?" + queryString;
    final header = await headers();
    http.Response response;
    try {
      response = await http
          .get(Uri.parse(requestUrl), headers: header)
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }
}
