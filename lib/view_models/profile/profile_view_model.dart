import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:workfun_app_teletubbie/apis/profile/profile_api.dart';
import 'package:workfun_app_teletubbie/models/profile/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  ProfileModel? profileModel;
  bool isLoading = false;

  Future<void> getProfile() async {
    profileModel = null;
    isLoading = true;
    try {
      final response = await ProfileApi.getProfileApi();
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body)['data'];
        if (jsonRes != null) {
          profileModel = ProfileModel.fromJson(jsonRes);
        }
      }
      isLoading = false;
      notifyListeners();
    } catch (_) {
    }
  }
}
