import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/label_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: whiteColor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
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
                decoration: inputTextField("ປ້ອນຊື່", null),
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w300,
                    fontSize: 18),
              ),
              labelText("ນາມສະກຸນ:"),
              TextField(
                decoration: inputTextField("ປ້ອນນາມສະກຸນ", null),
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w300,
                    fontSize: 18),
              ),
              labelText("ອີເມວ:"),
              TextField(
                decoration: inputTextField("doe@example.com", null),
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w300,
                    fontSize: 18),
              ),
              labelText("ເບີໂທ:"),
              TextField(
                decoration: inputTextField("12345678", null,
                    prefix: true,
                    widget: const Icon(
                      Icons.phone,
                      color: grayColor,
                    )),
                style: robotoFont(
                    fontColor: blackColor,
                    fontWieght: FontWeight.w300,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
