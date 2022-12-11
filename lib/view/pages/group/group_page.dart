// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:workfun_app_teletubbie/constants/app_info.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/pages/group/create_group.dart';
import 'package:workfun_app_teletubbie/view/pages/group/join_group_page.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view_models/group/group_view_model.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  GroupViewModel? viewModel;
  @override
  void initState() {
    viewModel = Provider.of<GroupViewModel>(context, listen: false);
    viewModel?.checkUserHasGroup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Consumer(builder:
            (BuildContext context, GroupViewModel _viewModel, Widget? child) {
          _viewModel.context = context;
          return _selector();
        }),
      ),
    );
  }

  Widget _selector() {
    if (viewModel!.isLoading) {
      return Container(
        width: double.infinity,
        height: 300,
        alignment: Alignment.center,
        child: pageOnLoading(),
      );
    } else if (!viewModel!.isLoading) {
      if (viewModel!.userHasGroup) {
        return _hasGroup();
      } else {
        return _noGroup();
      }
    } else {
      return Container(
        width: double.infinity,
        height: 400,
        alignment: Alignment.center,
        child: pageOnLoading(),
      );
    }
  }

  Widget _noGroup() {
    return Column(
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: yellowColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SvgPicture.asset(groupArtwork),
        ),
        heightBox(40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => JoinGroupPage()));
            },
            child: Container(
              width: double.infinity,
              height: 59,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Join group",
                style: robotoFont(
                  fontWieght: FontWeight.w600,
                  fontColor: yellowColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        heightBox(20),
        Text(
          "or",
          style: robotoFont(fontColor: grayColor),
        ),
        heightBox(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateGourpPage()));
            },
            child: Container(
              width: double.infinity,
              height: 59,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Create group",
                style: robotoFont(
                  fontWieght: FontWeight.w600,
                  fontColor: whiteColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _hasGroup() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: yellowColorLight.withOpacity(.5),
                ),
                child: Icon(Icons.groups, color: yellowColor, size: 40),
              ),
              widthBox(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${viewModel?.groupInfoModel?.groupInfo?.name}",
                      style: robotoFont(
                        fontSize: 16,
                        fontWieght: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    heightBox(5),
                    Text(
                      "${viewModel?.groupInfoModel?.groupInfo?.description}",
                      style: robotoFont(
                        fontSize: 14,
                        fontWieght: FontWeight.w300,
                        fontColor: grayColorDark,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightBox(20),
          labelText("Group ID"),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 59,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF8F8F8),
            ),
            child: Text(
              "${viewModel?.groupInfoModel?.groupInfo?.code}",
              style: robotoFont(
                  fontColor: yellowColor, fontWieght: FontWeight.w600),
            ),
          ),
          heightBox(20),
          labelText("Members"),
          heightBox(10),
          viewModel!.groupInfoModel?.groupInfo != null &&
                  viewModel!.groupInfoModel!.groupUser!.isNotEmpty
              ? Column(
                  children: viewModel!.groupInfoModel!.groupUser!.map((item) {
                    return InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                            ),
                            child: SvgPicture.string(
                              randomAvatarString(
                                DateTime.now().toIso8601String(),
                                trBackground: false,
                              ),
                            ),
                          ),
                          widthBox(15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${item.user?.name} ${item.user?.surname}",
                                      style: notosansFont(
                                        fontWieght: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    widthBox(8),
                                    Text(
                                      "${item.type}",
                                      style: robotoFont(
                                        fontSize: 14,
                                        fontColor: item.type == 'admin'? yellowColor : grayColor,
                                        fontWieght: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "${item.user?.tel}",
                                  style: notosansFont(
                                      fontWieght: FontWeight.w400,
                                      fontSize: 14,
                                      fontColor: grayColorDark),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : heightBox(0),
        ],
      ),
    );
  }
}
