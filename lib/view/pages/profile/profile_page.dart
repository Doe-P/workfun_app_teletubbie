import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view_models/profile/profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileViewModel? profileViewModel;

  @override
  void initState() {
    profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel?.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder:
        (BuildContext context, ProfileViewModel _viewModel, Widget? child) {
      _viewModel.context = context;
      return selectWidget();
    }));
  }

  Widget selectWidget() {
    if (profileViewModel!.isLoading) {
      return Center(
        child: pageOnLoading(),
      );
    } else if (!profileViewModel!.isLoading &&
        profileViewModel!.profileModel != null) {
      return bodyWidget();
    }
    return Center(
      child: labelText("No Data"),
    );
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
                child: randomAvatar(DateTime.now().toIso8601String(),
                    trBackground: false, height: 100)),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox(50),
                labelText("Name", color: yellowColor),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    profileViewModel!.profileModel!.name.toString(),
                    style: styleOption(color: grayColor, fontSize: 14),
                  ),
                ),
                Container(
                  height: 1,
                  color: grayColor.withOpacity(.3),
                ),
                labelText("Email", color: yellowColor),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    profileViewModel!.profileModel!.email.toString(),
                    style: styleOption(color: grayColor, fontSize: 14),
                  ),
                ),
                Container(
                  height: 1,
                  color: grayColor.withOpacity(.3),
                ),
                labelText("Tel", color: yellowColor),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    profileViewModel!.profileModel!.tel.toString(),
                    style: styleOption(color: grayColor, fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
