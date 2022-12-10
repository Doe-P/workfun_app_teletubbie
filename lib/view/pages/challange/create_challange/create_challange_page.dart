import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view_models/auth/sign_in_view_model.dart';
import 'package:workfun_app_teletubbie/view_models/challenge/challenge_view_model.dart';

import '../../../style/text_style.dart';
import '../../../widgets/input_widget.dart';

class CreateChallangePage extends StatefulWidget {
  const CreateChallangePage({Key? key}) : super(key: key);

  @override
  State<CreateChallangePage> createState() => _CreateChallangePageState();
}

class _CreateChallangePageState extends State<CreateChallangePage> {
  ChallengeViewModel? challengeViewModel;
  bool changePointBtnColor = false;
  List<Color>? tileColors;

  @override
  void initState() {
    challengeViewModel =
        Provider.of<ChallengeViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyWidget());
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
                    "assets/svg/create_challenge.svg",
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
                    labelText("ປະເພດ"),
                    DropdownButtonFormField(
                        value: challengeViewModel!.challengeTypeId,
                        isExpanded: true,
                        decoration: dropdownInputDecoration(
                            "ເລືອກປະເພດ Challenge",
                            challengeViewModel?.challengeTypeError),
                        items: challengeViewModel?.challengeType.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: notosansFont(fontWieght: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            challengeViewModel?.challengeTypeId = value;
                          });
                          challengeViewModel?.checkChallengeTypeIsEmpty(value);
                        }),
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
                    labelText("ເລືອກສະມາຊິກ"),
                    DropdownButtonFormField(
                        value: challengeViewModel!.challengeTypeId,
                        isExpanded: true,
                        decoration: dropdownInputDecoration("ເລືອກສະມາຊິກ",
                            challengeViewModel?.challengeTypeError),
                        items: challengeViewModel?.challengeType.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: notosansFont(fontWieght: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            challengeViewModel?.challengeTypeId = value;
                          });
                          challengeViewModel?.checkChallengeTypeIsEmpty(value);
                        }),
                    labelText("Points"),
                    Container(
                      height: 90,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: challengeViewModel?.point.length,
                          itemBuilder: (BuildContext context, index) {
                            final item = challengeViewModel?.point[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  changePointBtnColor = true;
                                  for (int i = 0;
                                      i < challengeViewModel!.point.length;
                                      i++)
                                    tileColors![i] = grayColor.withOpacity(.1);

                                  tileColors![index] = yellowColor;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: changePointBtnColor
                                          ? yellowColor
                                          : grayColor.withOpacity(.1)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/svg/point.svg"),
                                      labelText(item.toString(),
                                          color: yellowColor)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    heightBox(20),
                    materialbutton(MediaQuery.of(context).size.width, null,
                        "ສ້າງ Challenge")
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
