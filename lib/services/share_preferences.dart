
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workfun_app_teletubbie/constants/storage.dart';

class SharePreferences{
    static Future<void> setRemember(String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(REMEMBER_ME, phone);
  }

  static Future<String> getRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? rememberTxt = prefs.getString(REMEMBER_ME);
    return rememberTxt ?? "";
  }

  static Future<void> removeRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(REMEMBER_ME);
  }

  // ------ set accessToken --------------------------------

  static Future<void> setAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN, accessToken);
  }

  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(ACCESS_TOKEN);
    return token ?? "";
  }

  static Future<void> removeAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(ACCESS_TOKEN);
  }
}