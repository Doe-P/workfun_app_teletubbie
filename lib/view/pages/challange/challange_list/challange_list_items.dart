import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/constants/app_info.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/pages/challange/challange_list/challange_detail.dart';

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
      return bodyWidget();
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
        challengeViewModel!.challengeListModel != null) {
      return bodyWidget2();
    } else {
      return labelText("No Data");
    }
  }

  Widget bodyWidget2() {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: challengeViewModel?.challengeListModel!.length,
        itemBuilder: (context, index) {
          final item = challengeViewModel?.challengeListModel![index];
          return InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 27, 15, 27),
              margin: const EdgeInsets.only(bottom: 20),
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
                        Text(
                          item!.title!,
                          style: notosansFont(fontWieght: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.description!,
                          style: notosansFont(
                              fontWieght: FontWeight.w300, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [
            heightBox(20),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Task", style: robotoFont()),
                        InkWell(
                          onTap: () {},
                          child: Text("see all",
                              style: robotoFont(
                                  fontSize: 14,
                                  fontWieght: FontWeight.w100,
                                  fontColor: blackColor)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(15, 27, 15, 27),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Document",
                                        style: notosansFont(
                                            fontWieght: FontWeight.w600),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: notosansFont(
                                            fontWieght: FontWeight.w300,
                                            fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChallengeDetailPage(
                                      status: "todo",
                                      challengeId: "1",
                                    )));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(15, 27, 15, 27),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Document",
                                        style: notosansFont(
                                            fontWieght: FontWeight.w600),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: notosansFont(
                                            fontWieght: FontWeight.w300,
                                            fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
