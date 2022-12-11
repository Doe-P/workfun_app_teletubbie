import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';

import '../../../../view_models/challenge/challenge_view_model.dart';
import '../../../style/text_style.dart';
import '../../../widgets/help_widget.dart';
import '../../../widgets/input_widget.dart';

class ChallengeDetailPage extends StatefulWidget {
  const ChallengeDetailPage({super.key, this.challengeId, this.status});

  final String? challengeId;
  final String? status;

  @override
  State<ChallengeDetailPage> createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  ChallengeViewModel? challengeViewModel;
  @override
  void initState() {
    challengeViewModel =
        Provider.of<ChallengeViewModel>(context, listen: false);
    challengeViewModel?.getChellengeDetail("1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder:
          (BuildContext context, ChallengeViewModel _viewModel, Widget? child) {
        _viewModel.context = context;
        return selectWidget();
      }),
    );
  }

  Widget selectWidget() {
    if (challengeViewModel!.isLoading) {
      return Container(
        width: double.infinity,
        height: 300,
        alignment: Alignment.center,
        child: pageOnLoading(),
      );
    } else if (!challengeViewModel!.isLoading &&
        challengeViewModel!.challengeDetail != null) {
      return bodyWidget();
    }
    return Container(
      width: double.infinity,
      height: 300,
      alignment: Alignment.center,
      child: pageOnLoading(),
    );
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: whiteColor,
      child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Container(
                height: 150,
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
                      enabled: false,
                      decoration: inputTextField(
                          challengeViewModel!.challengeDetail!.title.toString(),
                          null),
                      controller: challengeViewModel?.title,
                      // onChanged: challengeViewModel?.checkNameIsEmpty,
                      style: robotoFont(
                          fontColor: blackColor,
                          fontWieght: FontWeight.w400,
                          fontSize: 18),
                    ),
                    labelText("ລາຍລະອຽດ"),
                    TextField(
                      enabled: false,
                      maxLines: 5,
                      decoration: inputTextField(
                          challengeViewModel!.challengeDetail!.description
                              .toString(),
                          null),
                      controller: challengeViewModel?.description,
                      // onChanged: challengeViewModel?.checkNameIsEmpty,
                      style: robotoFont(
                          fontColor: blackColor,
                          fontWieght: FontWeight.w400,
                          fontSize: 18),
                    ),
                    labelText("ປະເພດ"),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        challengeViewModel!.challengeDetail!.type.toString(),
                        style: styleOption(fontSize: 25, color: yellowColor),
                      ),
                    ),
                    labelText("Point"),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        challengeViewModel!.challengeDetail!.point.toString(),
                        style: styleOption(
                            fontSize: 35,
                            color: yellowColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (widget.status == "doing")
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelText("ລະດັບຄວາມຍາກ-ງ່າຍ"),
                            DropdownButtonFormField(
                                value: challengeViewModel!.scoreId,
                                isExpanded: true,
                                decoration: dropdownInputDecoration(
                                    "ເລືອກລະດັບ (1-5)", null),
                                items: challengeViewModel?.score.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.toString(),
                                      style: notosansFont(
                                          fontWieght: FontWeight.w400),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    challengeViewModel?.scoreId = value;
                                  });
                                  // appViewModel?.checkPositionIsEmpty(value);
                                }),
                          ],
                        ),
                      ),
                    heightBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        materialbutton(MediaQuery.of(context).size.width / 3,
                            () {
                          challengeViewModel!.updateChallengeStatus("1");
                        }, widget.status == "todo" ? "Doing" : "Done",
                            btnColor: yellowColor),
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
