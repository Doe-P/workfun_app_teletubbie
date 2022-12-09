// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  // init variables --------------------------------
  bool isShowPassword = false;
  bool isShowConfPassword = false;

//  show password text when clicked
  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  showConfPassword(){
    isShowConfPassword = !isShowConfPassword;
    notifyListeners();
  }
}
