// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/services/share_preferences.dart';
import 'package:workfun_app_teletubbie/view/appbar/home_appbar.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/pages/challange/challange_list/challange_list_page.dart';
import 'package:workfun_app_teletubbie/view/pages/challange/create_challange/create_challange_page.dart';
import 'package:workfun_app_teletubbie/view/pages/group/group_page.dart';
import 'package:workfun_app_teletubbie/view/pages/profile/profile_page.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String userType = "";
  List<BottomNavigationBarItem> menusBar = [];
  List<Widget> pageList = [];

  @override
  void initState(){
    checkUserType();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: whiteColor,
        child: pageList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: menusBar.map((e) => e).toList(),
        backgroundColor: whiteColor,
        elevation: 0,
        selectedLabelStyle: notosansFont(
            fontSize: 14, fontColor: yellowColor, fontWieght: FontWeight.w400),
        unselectedLabelStyle:
            notosansFont(fontColor: grayColorDark, fontSize: 12),
        selectedItemColor: yellowColor,
        unselectedItemColor: grayColorDark,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onSelectTab,
      ),
    );
  }

  _onSelectTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> checkUserType() async {
    userType = await SharePreferences.getUserPermission();
    setState(() {
      if (userType == "admin") {
      menusBar.addAll([
        BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "ລາຍການ"),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "ທ້າທາຍ"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "ກຸ່ມ"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "ໂປຣຟາຍ"),
      ]);

      pageList.addAll([
        ChallangeListPage(),
        CreateChallangePage(),
        GroupPage(),
        ProfilePage(),
      ]);
    } else {
     menusBar.addAll([
        BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "ລາຍການ"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "ກຸ່ມ"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "ໂປຣຟາຍ"),
      ]);
      pageList.addAll([
        ChallangeListPage(),
        GroupPage(),
        ProfilePage(),
      ]);
    }
    });
  }
}
