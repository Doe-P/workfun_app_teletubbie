import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/constants/provider.dart';
import 'package:workfun_app_teletubbie/view/pages/auth/sign_up_page.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WorkFun',
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
