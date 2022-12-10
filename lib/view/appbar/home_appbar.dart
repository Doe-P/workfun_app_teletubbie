// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

class HomeAppbar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppbar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  final Size preferredSize;
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: yellowColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Icon(Icons.notifications, color: whiteColor, size: 30),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: redColorDark,
                      shape: BoxShape.circle,
                    ),
                    child: Text("10",
                        style: robotoFont(fontSize: 10, fontColor: whiteColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
