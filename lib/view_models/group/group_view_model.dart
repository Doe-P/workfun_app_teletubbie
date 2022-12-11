// ignore_for_file: unused_field, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/apis/group/group_api.dart';
import 'package:workfun_app_teletubbie/models/group/model_group.dart';
import 'package:workfun_app_teletubbie/services/share_preferences.dart';
import 'package:workfun_app_teletubbie/view/widgets/dialog_widget.dart';
import 'package:workfun_app_teletubbie/view/widgets/help_widget.dart';

class GroupViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  // init state
  TextEditingController txtGroupName = TextEditingController();
  TextEditingController txtGroupDecs = TextEditingController();

  TextEditingController txtCodeGroup = TextEditingController();

  bool isLoading = false;
  bool userHasGroup = false;

  GroupInfoModel? groupInfoModel;

  void validateCreateGroup() async {
    await focusDisable(_currentContext);
    if (txtGroupName.text.isNotEmpty && txtGroupName.text.isNotEmpty) {
      _createGroup();
    }
  }

  void _createGroup() async {
    final body = {
      "name": txtGroupName.text,
      "description": txtGroupDecs.text,
      "_method": "POST",
    };
    showDialog();
    final response = await GroupApi.createGroup(body);
    closeDialog();
    if (response.statusCode == 200) {
      clearText();
      await Dialogs.successDialog(_currentContext, "ສ້າງກຸ່ມສຳເລັດແລ້ວ");
      await checkUserHasGroup();
      Navigator.of(_currentContext).pop();
    } else if (response.statusCode == 422) {
      await Dialogs.errorDialog(
          _currentContext, "ຂໍ້ມູນບໍ່ຄົບຖ້ວນ ກະລຸນາປ້ອນໃໝ່");
    } else {
      await Dialogs.errorDialog(
          _currentContext, "ເກີດຂໍ້ຜິດພາດ ${response.statusCode}");
    }

    notifyListeners();
  }

  // check user has a group
  Future<void> checkUserHasGroup() async {
    isLoading = true;
    userHasGroup = await SharePreferences.getUserHasGroup();

    if (userHasGroup) {
      await fetchGroupInformation();
    }

    isLoading = false;
    notifyListeners();
  }

  // fetch group information

  Future<void> fetchGroupInformation() async {
    final response = await GroupApi.fetchGroupInfo();
    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body)['data'];
      if (jsonRes != null) {
        groupInfoModel = GroupInfoModel.fromJson(jsonRes);
      }
    }
  }

  // validate code for invite to group
  void validateCodeInvite() async {
    await focusDisable(_currentContext);
    if (txtCodeGroup.text.isNotEmpty) {
      await joinGroup();
    }
  }

  // join group function
  Future<void> joinGroup() async {
    Map<String, String> body = {"code": txtCodeGroup.text.toString()};
    try {
      showDialog();
      final response = await GroupApi.joinGroup(body);
      closeDialog();
      if (response.statusCode == 200) {
        await Dialogs.successDialog(
            _currentContext, "ທ່ານໄດ້ເປັນສະມາຊິກກຸ່ມແລ້ວ");
        await checkUserHasGroup();
        Navigator.of(_currentContext).pop();
      } else if (response.statusCode == 422) {
        await Dialogs.errorDialog(_currentContext, "ລະຫັດເຂົ້າກຸ່ມບໍ່ຖືກຕ້ອງ");
      } else {
        await Dialogs.errorDialog(
            _currentContext, "ເກີດຂໍ້ຜິດພາດ ${response.statusCode}");
      }
    } catch (_) {}
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

  // clear text fields
  void clearText() {
    txtGroupName.text = "";
    txtGroupDecs.text = "";
  }
}
