// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:workfun_app_teletubbie/apis/challenge/challenge_api.dart';
import 'package:workfun_app_teletubbie/apis/group/group_api.dart';
import 'package:workfun_app_teletubbie/models/group/model_group.dart';
import 'package:workfun_app_teletubbie/services/share_preferences.dart';
import 'package:workfun_app_teletubbie/view/widgets/dialog_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';

class ChallengeViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  List<String> challengeType = ['task', 'activity'];
  dynamic challengeTypeId;
  List<int> point = [100, 75, 50, 25];
  List<int> score = [1, 2, 3, 4, 5];

  int pointSelected = 0;

  List memberList = [];

  GroupInfoModel? groupInfoModel;

  bool isLoading = false;
  bool userHasGroup = false;

  String? challengeTypeError;

  void checkChallengeTypeIsEmpty(final position) {
    if (position == null) {
      challengeTypeError = "* ກະລຸນາເລືອກປະເພດ";
    } else {
      challengeTypeError = null;
    }
    notifyListeners();
  }

  Future<void> checkUserHasGroup() async {
    isLoading = true;
    userHasGroup= await SharePreferences.getUserHasGroup();

    if (userHasGroup) {
      await fetchGroupInformation();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchGroupInformation() async {
    final response = await GroupApi.fetchGroupInfo();
    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body)['data'];
      if (jsonRes != null) {
        groupInfoModel = GroupInfoModel.fromJson(jsonRes);
      }
    }
  }

  void validateChallangeInfo() async {
    await focusDisable(_currentContext);
    if (challengeTypeId != null &&
        title.text.isNotEmpty &&
        description.text.isNotEmpty &&
        memberList.isNotEmpty &&
        pointSelected > 0) {
      _createChallange();
    }
  }

  void _createChallange() async {
    Map body = {
      "title": title.text,
      "description": description.text,
      "type": challengeTypeId,
      "point": pointSelected,
      "users": memberList,
    };

    showDialog();
    final response = await ChallangeApi.createChallange(body);
    closeDialog();
    if (response.statusCode == 200) {
      clearDataBody();
      await Dialogs.successDialog(_currentContext, "ສ້າງ task ສຳເລັດ");
    } else if (response.statusCode == 422) {
      await Dialogs.errorDialog(_currentContext, "ຂໍ້ມູນບໍ່ຄົບຖ້ວນ");
    } else {
      await Dialogs.errorDialog(
          _currentContext, "ເກີດຂໍ້ຜິດພາດ ${response.statusCode}");
    }
    notifyListeners();
  }

  // set dialog context
  showDialog() {
    return Dialogs.showLoadingDialog(_currentContext);
  }

//  close dialog
  Future<void> closeDialog() async {
    final navigator = Navigator.of(_currentContext);
    if (navigator.canPop()) {
      return navigator.pop();
    }
  }

  void clearDataBody() {
    title.text = "";
    description.text = "";
    challengeTypeId = null;
    memberList.clear();
    pointSelected = 0;
  }
}
