import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/apis/auth/auth_api.dart';
import 'package:workfun_app_teletubbie/view/pages/auth/sign_up_page.dart';
import 'package:workfun_app_teletubbie/view/widgets/dialog_widget.dart';

import '../../services/share_preferences.dart';
import '../../view/widgets/help_widget.dart';

class SignInViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  // init variables --------------------------------
  bool isShowPassword = false;
  bool isShowConfPassword = false;
  bool isLoading = false;
  bool isRememberMe = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? emailIsError;
  String? passwordIsError;

  ///// --------------------- functions --------------------
//  show password text when clicked
  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void checkEmailIsEmpty(String email) {
    if (email.isEmpty) {
      emailIsError = "* ກະລຸນາລະບຸອີເມວ";
    } else {
      emailIsError = null;
    }
    notifyListeners();
  }

  void checkPasswordIsEmpty(String password) {
    if (password.isEmpty) {
      passwordIsError = "* ກະລຸນາລະບຸລະຫັດຜ່ານ";
    } else {
      passwordIsError = null;
    }
    notifyListeners();
  }

  void validateSignIn() async {
    print("working");
    await focusDisable(_currentContext);
    checkEmailIsEmpty(email.text);
    checkPasswordIsEmpty(password.text);

    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      _doSignIn();
    }
  }

  void _doSignIn() async {
    final data = {'credentials': email.text, 'password': password.text};
    final response = await AuthApi.signIn(data);
    print("==========>$data");
    print("data=====>${response.body}");
    try {
      if (response.statusCode == 200) {
        String accessToken =
            jsonDecode(response.body)['data']['credentials']['access_token'];

        if (accessToken.isNotEmpty) {
          print("go to homepage");
          //go to home page
          Navigator.of(_currentContext)
              .push(MaterialPageRoute(builder: (context) => SignUpPage()));

          print("data===>$data");
          print("access_token===>$accessToken");
          await SharePreferences.setAccessToken(accessToken);
          isRememberMe
              ? await SharePreferences.setRemember(email.text)
              : await SharePreferences.removeRemember();
          email.text = "";
        } else {
          Dialogs.errorDialog(
              _currentContext, "ມີບາງຢ່າງຜີດພາດ ກະລຸນາລອງໃໝ່ອີກຄັ້ງ");
        }
      } else if (response.statusCode == 401) {
        Dialogs.errorDialog(
            _currentContext, 'ເບີໂທ ຫຼື ລະຫັດຜ່ານຂອງທ່ານບໍ່ຖືກຕ້ອງ.');
      } else {
        Dialogs.errorDialog(
            _currentContext, jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print("error==>$e");
    }
  }
}
