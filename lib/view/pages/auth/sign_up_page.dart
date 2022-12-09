// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/label_text.dart';
import 'package:workfun_app_teletubbie/view/widgets/sizebox_widget.dart';
import 'package:workfun_app_teletubbie/view_models/auth/sign_up_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpViewModel? appViewModel;

  @override
  void initState() {
    appViewModel = Provider.of<SignUpViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: whiteColor,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer(
              builder: (BuildContext context, SignUpViewModel _viewModel,
                  Widget? child) {
                _viewModel.context = context;
                return _bodyWidget();
              },
            )),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: yellowColor,
          alignment: Alignment.center,
          child: Text(
            "LOGO",
            style: robotoFont(
              fontWieght: FontWeight.bold,
            ),
          ),
        ),
        labelText("ຊື່:"),
        TextField(
          decoration: inputTextField("ຊື່", null),
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ນາມສະກຸນ:"),
        TextField(
          decoration: inputTextField("ນາມສະກຸນ", null),
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ອີເມວ:"),
        TextField(
          decoration: inputTextField("doe@example.com", null),
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ເບີໂທ:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: grayColorLight,
                ),
                child: Text(
                  "+856 (20)",
                  style: robotoFont(),
                ),
              ),
            ),
            widthBox(11),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: inputTextField(
                  "12345678",
                  null,
                ),
                keyboardType: TextInputType.phone,
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        labelText("ລະຫັດຜ່ານ:"),
        TextField(
          decoration: inputTextField(
            "",
            null,
            subfix: true,
            widget: IconButton(
              onPressed: appViewModel?.showPassword,
              icon: appViewModel?.isShowPassword ?? true
                  ? const Icon(Icons.visibility, color: grayColorDark, size: 24)
                  : const Icon(Icons.visibility_off,
                      color: grayColorDark, size: 24),
            ),
          ),
          obscureText: !appViewModel!.isShowPassword,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),

        labelText("ຢືນຢັນລະຫັດຜ່ານ:"),
        TextField(
          decoration: inputTextField(
            "",
            null,
            subfix: true,
            widget: IconButton(
              onPressed: appViewModel?.showConfPassword,
              icon: appViewModel?.isShowConfPassword ?? true
                  ? const Icon(Icons.visibility, color: grayColorDark, size: 24)
                  : const Icon(Icons.visibility_off,
                      color: grayColorDark, size: 24),
            ),
          ),
          obscureText: !appViewModel!.isShowConfPassword,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
      ],
    );
  }
}
