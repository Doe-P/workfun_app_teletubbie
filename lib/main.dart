import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/pages/auth/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WorkFun',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
