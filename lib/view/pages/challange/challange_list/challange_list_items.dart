import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/constants/app_info.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';

import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view_models/challenge/challenge_view_model.dart';

class ChallageListItems extends StatefulWidget {
  const ChallageListItems({Key? key, required this.status}) : super(key: key);

  final String status;
  @override
  State<ChallageListItems> createState() => _ChallageListItemsState();
}

class _ChallageListItemsState extends State<ChallageListItems> {
  ChallengeViewModel? challengeViewModel;

  @override
  void initState() {
    challengeViewModel =
        Provider.of<ChallengeViewModel>(context, listen: false);
    challengeViewModel?.getChellengeList(widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, ChallengeViewModel _viewModel, Widget? child) {
      _viewModel.context = context;
      return selectWidget();
    });
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
        challengeViewModel!.challengeListModel.isNotEmpty) {
      return bodyWidget2();
    } else {
      return Center(
        child: labelText("No Data"),
      );
    }
  }

  Widget bodyWidget2() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: challengeViewModel?.challengeListModel.length,
        itemBuilder: (BuildContext context, index) {
          final item = challengeViewModel?.challengeListModel[index];
          return InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 27, 15, 27),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: cardColor, borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(challangeListIcon),
                  ),
                  widthBox(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${item?.challenge?.title}",
                              style: notosansFont(fontWieght: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "+${item?.challenge?.point}",
                              style: robotoFont(
                                  fontColor: greenColor,
                                  fontWieght: FontWeight.w800,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Text(
                          "${item?.challenge?.description}",
                          style: notosansFont(
                              fontWieght: FontWeight.w300, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: yellowColor,
                              ),
                              child: Text(
                                "${item?.challenge?.type}",
                                style:
                                    robotoFont(fontSize: 12, fontColor: whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
