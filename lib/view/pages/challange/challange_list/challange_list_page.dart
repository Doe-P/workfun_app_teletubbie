import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/pages/challange/challange_list/challange_list_items.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

class ChallangeListPage extends StatefulWidget {
  const ChallangeListPage({Key? key}) : super(key: key);

  @override
  State<ChallangeListPage> createState() => _ChallangeListPageState();
}

class _ChallangeListPageState extends State<ChallangeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 130,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              )
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TabBar(
                labelStyle: notosansFont(
                    fontSize: 14,
                    fontWieght: FontWeight.w600,
                    fontColor: blackColor),
                labelColor: whiteColor,
                unselectedLabelColor: blackColor,
                indicator: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: const [
                  Tab(text: "To Do"),
                  Tab(text: "Doing"),
                  Tab(text: "Done"),
                ],
              ),
            ),
          ),
          Expanded(
            child: IntrinsicHeight(
              child: TabBarView(
                children: [
                 const ChallageListItems(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
