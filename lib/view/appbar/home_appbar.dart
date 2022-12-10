
import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget with PreferredSizeWidget{
  const HomeAppbar({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight),
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
      
    );
  }
}