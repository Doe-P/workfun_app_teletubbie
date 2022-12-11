import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';

import '../../../../view_models/challenge/challenge_view_model.dart';
import '../../../style/text_style.dart';
import '../../../widgets/help_widget.dart';
import '../../../widgets/input_widget.dart';

class ChallengeDetailPage extends StatefulWidget {
  const ChallengeDetailPage({super.key});

  @override
  State<ChallengeDetailPage> createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  ChallengeViewModel? challengeViewModel;
  @override
  void initState() {
    challengeViewModel =
        Provider.of<ChallengeViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: whiteColor,
      child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                height: 130,
                decoration: const BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/update-change-list.svg",
                    height: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelText("ຫົວຂໍ້"),
                    TextField(
                      decoration: inputTextField("ຫົວຂໍ້", null),
                      controller: challengeViewModel?.title,
                      // onChanged: challengeViewModel?.checkNameIsEmpty,
                      style: robotoFont(
                          fontColor: blackColor,
                          fontWieght: FontWeight.w400,
                          fontSize: 18),
                    ),
                    labelText("ລາຍລະອຽດ"),
                    TextField(
                      maxLines: 5,
                      decoration: inputTextField("ລາຍລະອຽດ", null),
                      controller: challengeViewModel?.description,
                      // onChanged: challengeViewModel?.checkNameIsEmpty,
                      style: robotoFont(
                          fontColor: blackColor,
                          fontWieght: FontWeight.w400,
                          fontSize: 18),
                    ),
                    labelText("ລະດັບຄວາມຍາກ-ງ່າຍ"),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: challengeViewModel?.score.length,
                          itemBuilder: (BuildContext context, index) {
                            final item = challengeViewModel?.score[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: grayColor.withOpacity(.1)),
                                    child: Center(
                                      child: Text(
                                        item.toString(),
                                        style: styleOption(
                                            fontSize: 20, color: yellowColor),
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ),
                    heightBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        materialbutton(MediaQuery.of(context).size.width / 3,
                            null, "Doing",
                            btnColor: yellowColor.withOpacity(.3)),
                        materialbutton(
                          MediaQuery.of(context).size.width / 3,
                          null,
                          "Done",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
