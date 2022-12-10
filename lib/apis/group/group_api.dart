import 'package:http/http.dart' as http;
import 'package:workfun_app_teletubbie/apis/base_api.dart';
import 'package:workfun_app_teletubbie/apis/help_api.dart';

class GroupApi {
  // create a new group
  static Future<http.Response> createGroup(final body) async {
    final String url = "$endPoint/group";

    final header = await headers();
    http.Response response;
    try {
      response = await http
          .post(Uri.parse(url), headers: header, body: body)
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }
//  check user has group
  static Future<http.Response> checkUserHasGroup() async {
    final String url = "$endPoint/user/has/group";

    final header = await headers();
    http.Response response;
    try {
      response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }
  // fetch group information
  static Future<http.Response> fetchGroupInfo() async {
    final String url = "$endPoint/info/group";
    final header = await headers();
    http.Response response;
    try {
      response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }

   // join a group
  static Future<http.Response> joinGroup(Map<String,String> body) async {
    final String url = "$endPoint/join/group";
    final header = await headers();
    http.Response response;
    try {
      response = await http
          .post(Uri.parse(url), headers: header, body: body)
          .timeout(const Duration(seconds: 120));
    } catch (_) {
      response = BaseApi.noResponse();
    }

    return Future.value(response);
  }
}
