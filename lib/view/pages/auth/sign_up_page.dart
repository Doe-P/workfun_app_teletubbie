// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/appbar/share_appbar.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';
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
      appBar: const ShareAppbar(
        title: "ລົງທະບຽນ",
        color: whiteColor,
        center: true,
      ),
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
        // Container(
        //   width: double.infinity,
        //   height: 150,
        //   color: yellowColor,
        //   alignment: Alignment.center,
        //   child: Text(
        //     "LOGO",
        //     style: robotoFont(
        //       fontWieght: FontWeight.bold,
        //     ),
        //   ),
        // ),
        Center(
          child: Image.asset(
            "assets/app_logo.png",
            height: 100,
          ),
        ),
        labelText("ຊື່:"),
        TextField(
          decoration: inputTextField("ຊື່", appViewModel?.nameIsError),
          controller: appViewModel?.userName,
          onChanged: appViewModel?.checkNameIsEmpty,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ນາມສະກຸນ:"),
        TextField(
          decoration: inputTextField("ນາມສະກຸນ", appViewModel?.surnameIsError),
          controller: appViewModel?.userSurname,
          onChanged: appViewModel?.checkSurnameIsEmpty,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ອີເມວ:"),
        TextField(
          decoration:
              inputTextField("doe@example.com", appViewModel?.emailIsError),
          controller: appViewModel?.userEmail,
          onChanged: appViewModel?.checkEmailIsEmpty,
          style: robotoFont(
              fontColor: blackColor, fontWieght: FontWeight.w400, fontSize: 18),
        ),
        labelText("ຕຳແໜ່ງວຽກ:"),
        DropdownButtonFormField(
            value: appViewModel!.positionId,
            isExpanded: true,
            decoration: dropdownInputDecoration(
                "ເລືອກຕຳແໜ່ງວຽກ", appViewModel?.positionIsError),
            items: appViewModel?.positionList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: notosansFont(fontWieght: FontWeight.w400),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                appViewModel?.positionId = value;
              });
              appViewModel?.checkPositionIsEmpty(value);
            }),
        labelText("ເບີໂທ:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 56,
              width: 100,
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
            widthBox(11),
            Expanded(
              child: TextField(
                controller: appViewModel?.userPhone,
                onChanged: appViewModel?.checkPhoneIsEmpty,
                decoration: inputTextField(
                  "12345678",
                  appViewModel?.phoneIsError,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        labelText("ລະຫັດຜ່ານ (ຕ້ອງປະກອບດ້ວຍຕົວເລກແລະຕົວອັກສອນ)"),
        TextField(
          controller: appViewModel?.userPassword,
          onChanged: appViewModel?.checkPasswordIsEmpty,
          decoration: inputTextField(
            "",
            appViewModel?.passwordIsError,
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
          controller: appViewModel?.confirmPassword,
          onChanged: appViewModel?.checkConfPasswordIsEmpty,
          decoration: inputTextField(
            "",
            appViewModel?.confirmPasswordIsError,
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
        heightBox(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ມີບັນຊີຢູ່ແລ້ວບໍ່?",
              style: notosansFont(
                  fontSize: 15,
                  fontColor: grayColorDark,
                  fontWieght: FontWeight.w400),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "ເຂົ້າສູ່ລະບົບ",
                style: notosansFont(
                  fontColor: yellowColor,
                  fontSize: 15,
                  fontWieght: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        heightBox(20),
        InkWell(
          onTap: () {
            print("register working");
            appViewModel?.validateSignUp();
          },
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "ລົງທະບຽນ",
              style: notosansFont(
                fontSize: 16,
                fontColor: whiteColor,
                fontWieght: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
