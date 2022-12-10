// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/apis/auth/auth_api.dart';
import 'package:workfun_app_teletubbie/view/pages/auth/sign_in_page.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';

class SignUpViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  // init variables --------------------------------
  bool isShowPassword = false;
  bool isShowConfPassword = false;

  // textediting controller for input fields --------------------------------
  TextEditingController userName = TextEditingController();
  TextEditingController userSurname = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // for dropdown
  List<String> positionList = ["Developer", "Marketing", "Project Manager"];
  dynamic positionId;

  // for error messages when user input wrong
  String? nameIsError;
  String? surnameIsError;
  String? emailIsError;
  String? positionIsError;
  String? phoneIsError;
  String? passwordIsError;
  String? confirmPasswordIsError;

///// --------------------- functions --------------------
//  show password text when clicked
  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  showConfPassword() {
    isShowConfPassword = !isShowConfPassword;
    notifyListeners();
  }

//  check text fields is empty when register
  void checkNameIsEmpty(String name) {
    if (name.isEmpty) {
      nameIsError = "* ກະລຸນາລະບຸຊື່ຜູ້ໃຊ້";
    } else {
      nameIsError = null;
    }
    notifyListeners();
  }

  void checkSurnameIsEmpty(String surname) {
    if (surname.isEmpty) {
      surnameIsError = "* ກະລຸນາລະບຸນາມສະກຸນ";
    } else {
      surnameIsError = null;
    }
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

  void checkPositionIsEmpty(final position) {
    if (position == null) {
      positionIsError = "* ກະລຸນາລະບຸຕຳແໜ່ງວຽກ";
    } else {
      positionIsError = null;
    }
    notifyListeners();
  }

  void checkPhoneIsEmpty(String phone) {
    if (phone.isEmpty) {
      phoneIsError = "* ກະລຸນາປ້ອນລະບຸເບີໂທລະສັບ";
    } else if (phone.toString().length != 8) {
      phoneIsError = "* ເບີໂທລະສັບຕ້ອງເທົ່າກັບ 8 ຕົວເລກເທົ່ານັ້ນ";
    } else {
      phoneIsError = null;
    }
    notifyListeners();
  }

  void checkPasswordIsEmpty(String pass) {
    if (pass.isEmpty) {
      passwordIsError = "* ກະລຸນາລະບຸລະຫັດຜ່ານ";
    } else if (pass.length < 8) {
      passwordIsError = "* ລະຫັດຜ່ານຕ້ອງໃສ່ຢ່າງໜ້ອຍ 8 ຕົວ";
    } else {
      passwordIsError = null;
    }
    notifyListeners();
  }

  void checkConfPasswordIsEmpty(String confPass) {
    if (confPass.isEmpty) {
      confirmPasswordIsError = "* ກະລຸນາລະບຸລະຫັດຜ່ານ";
    } else if (userPassword.text != confirmPassword.text) {
      confirmPasswordIsError = "* ລະຫັດຜ່ານບໍ່ກົງກັນ";
    }
    // else if (identical(confPass, userPassword.text)) {
    //   confirmPasswordIsError = "* ລະຫັດຜ່ານບໍ່ກົງກັນ";
    // }
    else {
      confirmPasswordIsError = null;
    }
    notifyListeners();
  }

  void validateSignUp() async {
    await focusDisable(_currentContext);
    checkNameIsEmpty(userName.text);
    checkSurnameIsEmpty(userSurname.text);
    checkEmailIsEmpty(userEmail.text);
    checkPositionIsEmpty(positionId);
    checkPhoneIsEmpty(userPhone.text);
    checkPasswordIsEmpty(userPassword.text);
    checkConfPasswordIsEmpty(confirmPassword.text);

    if (userName.text.isNotEmpty &&
        userSurname.text.isNotEmpty &&
        userEmail.text.isNotEmpty &&
        // positionId != null &&
        userPhone.text.isNotEmpty &&
        userPassword.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      _doSignUp();
    }

    notifyListeners();
  }

  void _doSignUp() async {
    final data = {
      'name': userName.text.toString(),
      'surname': userSurname.text.toString(),
      'email': userEmail.text.toString(),
      'tel': userPhone.text.toString(),
      'password': userPassword.text.toString(),
      'password_confirmation': confirmPassword.text.toString()
    };

    print("data=>$data");
    final response = await AuthApi.signUp(data);

    if (response.statusCode == 200) {
      print("register!!");
      Navigator.of(_currentContext)
          .push(MaterialPageRoute(builder: (context) => SignInPage()));
    }

    print("status code===>${response.statusCode}=====${response.reasonPhrase}");

    notifyListeners();
  }
}
