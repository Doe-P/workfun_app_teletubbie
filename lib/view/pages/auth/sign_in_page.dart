// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';
import 'package:workfun_app_teletubbie/view_models/auth/sign_in_view_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInViewModel? signInViewModel;
  late bool showPassword = false;

  onShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void initState() {
    signInViewModel = Provider.of<SignInViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: whiteColor,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer(builder: (BuildContext context,
                SignInViewModel _viewModel, Widget? child) {
              _viewModel.context = context;
              return _bodyWidget();
            })),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Image.asset(
          "assets/app_logo.png",
          height: 100,
        )),
        heightBox(30),
        labelText("ອີເມວ"),
        heightBox(10),
        TextField(
          controller: signInViewModel?.email,
          onChanged: signInViewModel?.checkEmailIsEmpty,
          decoration: inputTextField("ອີເມວ", signInViewModel?.emailIsError),
          style: styleOption(),
        ),
        labelText("ລະຫັດຜ່ານ"),
        TextField(
          controller: signInViewModel?.password,
          onChanged: signInViewModel?.checkPasswordIsEmpty,
          decoration: inputTextField(
            "ລະຫັດຜ່ານ",
            signInViewModel?.passwordIsError,
            subfix: true,
            widget: IconButton(
              onPressed: signInViewModel?.showPassword,
              icon: signInViewModel?.isShowPassword ?? true
                  ? const Icon(Icons.visibility, color: grayColorDark, size: 24)
                  : const Icon(Icons.visibility_off,
                      color: grayColorDark, size: 24),
            ),
          ),
          obscureText: !signInViewModel!.isShowPassword,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        heightBox(10),
        Flex(
          direction: Axis.horizontal,
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: yellowColor,
              value: true,
              //value: viewModel!.rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  // viewModel!.isRemember(value!);
                });
              },
            ),
            Text("ຈື່ບັນຊີຂ້ອຍ", style: styleOption(fontSize: 15)),
          ],
        ),
        heightBox(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            labelText("ຍັງບໍ່ມີບັນຊີ ?"),
            GestureDetector(
              onTap: () {},
              child: labelText("ລົງທະບຽນ", color: yellowColor),
            )
          ],
        ),
        heightBox(35),
        SizedBox(
            height: 45,
            width: double.infinity,
            child: materialbutton(50, doSignIn, "ເຂົ້າສູ່ລະບົບ"))
      ],
    );
  }

  doSignIn() {
    signInViewModel?.validateSignIn();
  }
}
