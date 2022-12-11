// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
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
    challengeViewModel?.checkUserHasGroup();
    challengeViewModel?.clearDataBody();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder:
        (BuildContext context, ChallengeViewModel _viewModel, Widget? child) {
      _viewModel.context = context;
      return _selectWidget();
    }));
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: whiteColor,
      child: SingleChildScrollView(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelText("ປະເພດ"),
                DropdownButtonFormField(
                    value: challengeViewModel!.challengeTypeId,
                    isExpanded: true,
                    decoration: dropdownInputDecoration("ເລືອກປະເພດ Challenge",
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
                MultiSelectBottomSheetField(
                  items: challengeViewModel!.groupInfoModel!.groupUser!.map((item){
                    return MultiSelectItem(item.user?.id, "${item.user?.name}");
                  }).toList(),
                  title: Text("ເລືອກສະມາຊິກ", style: notosansFont()),
                  listType: MultiSelectListType.CHIP,
                  selectedColor: yellowColor,
                  itemsTextStyle: notosansFont(),
                  selectedItemsTextStyle: notosansFont(fontColor: whiteColor),
                  decoration: const BoxDecoration(
                    color: grayColorLight,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  buttonText: Text(
                    "ເລືອກສະມາຊິກ",
                    style: notosansFont(),
                  ),
                  onConfirm: (results) {
                   setState(() {
                     challengeViewModel?.memberList = results;
                   });
                  },
                ),
                labelText("Points"),
                heightBox(10),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: challengeViewModel?.point.length,
                      itemBuilder: (BuildContext context, index) {
                        final item = challengeViewModel?.point[index];
                         int idx = 0;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              idx = challengeViewModel!.point.elementAt(index);
                              challengeViewModel?.pointSelected = idx;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: idx == 100? yellowColor : grayColor.withOpacity(.1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/svg/point.svg"),
                                  labelText(item.toString(), color: yellowColor)
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                heightBox(30),
                materialbutton(
                    MediaQuery.of(context).size.width, challengeViewModel?.validateChallangeInfo, "ສ້າງ Challenge")
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _selectWidget() {
    if (challengeViewModel!.isLoading) {
      return pageOnLoading();
    } else if (!challengeViewModel!.isLoading &&
        challengeViewModel?.groupInfoModel != null) {
      return bodyWidget();
    }
    return pageOnLoading();
  }
  
  checkPoint(int idx) {
    if(idx == 100 || idx == 75 || idx == 50 || idx == 25){
      return  yellowColor;
    }else {
      return grayColor.withOpacity(.1);
    }
  }
}
