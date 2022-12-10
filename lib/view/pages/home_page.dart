// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/appbar/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: HomeAppbar());
  }
}