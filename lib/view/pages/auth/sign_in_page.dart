import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late bool showPassword = false;

  onShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(50),
            Center(
              child: Text(
                "WorkFun",
                style: styleOption(color: yellowColor, fontSize: 35),
              ),
            ),
            labelText("ອີເມວ"),
            heightBox(10),
            TextField(
              decoration: inputTextField("ອີເມວ", null),
              style: styleOption(),
            ),
            labelText("ລະຫັດຜ່ານ"),
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
                      Text("ຈື່ບັນຊີຂ້ອຍ", style: styleOption(fontSize: 18)),
                    ],
                  ),
            // TextField(
            //   style: notosansFont(),
            //   obscureText: !showPassword,
            //   decoration: inputPassword(
            //       "ລະຫັດຜ່ານ", null, onShowPassword, showPassword),
            // ),
            heightBox(35),
            SizedBox(
                height: 45,
                width: double.infinity,
                child: materialbutton(50, null, "ເຂົ້າສູ່ລະບົບ"))
          ],
        ),
      ),
    );
  }
}
