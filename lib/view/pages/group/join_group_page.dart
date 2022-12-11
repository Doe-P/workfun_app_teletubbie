// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workfun_app_teletubbie/constants/app_info.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/input_widget.dart';
import 'package:workfun_app_teletubbie/view_models/group/group_view_model.dart';

class JoinGroupPage extends StatefulWidget {
  const JoinGroupPage({Key? key}) : super(key: key);

  @override
  State<JoinGroupPage> createState() => _JoinGroupPageState();
}

class _JoinGroupPageState extends State<JoinGroupPage> {
  GroupViewModel? viewModel;
  @override
  void initState() {
    viewModel = Provider.of<GroupViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: yellowColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: whiteColor,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder:
            (BuildContext context, GroupViewModel _viewModel, Widget? child) {
          _viewModel.context = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              heightBox(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: labelText("Group ID"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: viewModel?.txtCodeGroup,
                  decoration: inputTextField("xx-xxx-xxx-x", null),
                ),
              ),
              heightBox(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: viewModel?.validateCodeInvite,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 59,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Join group",
                      style: robotoFont(
                        fontWieght: FontWeight.w600,
                        fontColor: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
