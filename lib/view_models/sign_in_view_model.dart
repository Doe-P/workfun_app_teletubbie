import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  // init variables --------------------------------
  bool isShowPassword = false;
  bool isShowConfPassword = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}
