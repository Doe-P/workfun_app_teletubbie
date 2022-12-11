import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:workfun_app_teletubbie/apis/challenge/challenge_api.dart';
import 'package:workfun_app_teletubbie/models/challenge/challenge_list_model.dart';

class ChallengeViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  bool isLoading = false;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  List<String> challengeType = ['ວຽກ', 'ກິດຈະກຳ'];
  dynamic challengeTypeId;
  List<int> point = [100, 75, 50, 25];
  List<int> score = [1, 2, 3, 4, 5];

  String? challengeTypeError;
  // List<ChallengeListModel>? challengeList;
  //ChallengeListModel? challengeListModel;
  List<ChallengeListModel>? challengeListModel;

  void checkChallengeTypeIsEmpty(final position) {
    if (position == null) {
      challengeTypeError = "* ກະລຸນາເລືອກປະເພດ";
    } else {
      challengeTypeError = null;
    }
    notifyListeners();
  }

  Future<void> getChellengeList(String status) async {
    Map<String, String> queryParams;
    queryParams = {"status": status};
    try {
      final response = await ChallengeApi.getChellengeApi(queryParams);

      if (response.statusCode == 200) {
        isLoading = true;
        final jsonRes = jsonDecode(response.body)['data'];
        for (var item in jsonRes) {
          challengeListModel?.add(ChallengeListModel.fromJson(item));
        }
      }
    } catch (e) {
      print("error======> $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
