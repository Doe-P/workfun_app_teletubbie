import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

class ShareAppbar extends StatelessWidget with PreferredSizeWidget {
  const ShareAppbar(
      {Key? key,
      required this.title,
      this.color = blackColor,
      this.center = false,
      this.elevation = 0.0})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Color color;
  final bool center;
  final double elevation;

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: elevation,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: blackColor,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: notosansFont(
          fontSize: 16,
          fontColor: blackColor,
          fontWieght: FontWeight.w600,
        ),
      ),
      centerTitle: center,
    );
  }
}
