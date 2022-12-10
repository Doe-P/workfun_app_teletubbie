import 'package:flutter/cupertino.dart';

class ChallengeViewModel extends ChangeNotifier {
  late BuildContext _currentContext;

  set context(context) {
    _currentContext = context;
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  List<String> challengeType = ['ວຽກ', 'ກິດຈະກຳ'];
  dynamic challengeTypeId;
  List<int> point = [100, 75, 50, 25];

  String? challengeTypeError;

  void checkChallengeTypeIsEmpty(final position) {
    if (position == null) {
      challengeTypeError = "* ກະລຸນາເລືອກປະເພດ";
    } else {
      challengeTypeError = null;
    }
    notifyListeners();
  }
}
