// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:workfun_app_teletubbie/apis/challenge/challenge_api.dart';
import 'package:workfun_app_teletubbie/apis/group/group_api.dart';
import 'package:workfun_app_teletubbie/models/challenge/challenge_list_model.dart';
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

  // for score dropdown
  List<int> score = [1, 2, 3, 4, 5];
  dynamic scoreId;

  List<ChallengeListModel> challengeListModel = [];
  Challenge? challengeDetail;

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
    userHasGroup = await SharePreferences.getUserHasGroup();

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

  //get challege list
  Future<void> getChellengeList(String status) async {
    Map<String, String> queryParams;
    queryParams = {"status": status};
    try {
      challengeListModel.clear();
      isLoading = true;
      final response = await ChallangeApi.getChellengeApi(queryParams);
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body)['data'];
        for (Map<String, dynamic> item in jsonRes) {
          challengeListModel.add(ChallengeListModel.fromJson(item));
        }
      }
    } catch (_) {}

    isLoading = false;
    notifyListeners();
  }

  //get challenge detail by id
  Future<void> getChellengeDetail(String challengeId) async {
    try {
      final response = await ChallangeApi.getChellengeDetailApi(challengeId);

      if (response.statusCode == 200) {
        isLoading = true;
        final jsonRes = jsonDecode(response.body)['data'];
        challengeDetail = Challenge.fromJson(jsonRes);
      }
    } catch (_) {}

    isLoading = false;
    notifyListeners();
  }

  //update challenge status
  Future<void> updateChallengeStatus(String challengeId) async {
    final data = {'score': scoreId};
    try {
      final response =
          await ChallangeApi.updateChellengeTodoToDoingApi(challengeId);

      if (response.statusCode == 200) {
        print("score data ====>$data");

        final result =
            await Dialogs.successDialog(_currentContext, "ອັບເດດສຳເລັດ");
        if (result) {
          Navigator.pop(_currentContext);
        }
      }
    } catch (_) {
      print("error $_");
    }
    notifyListeners();
  }
}
