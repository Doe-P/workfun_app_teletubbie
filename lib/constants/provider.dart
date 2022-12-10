import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:workfun_app_teletubbie/view_models/auth/sign_up_view_model.dart';
import 'package:workfun_app_teletubbie/view_models/challenge/challenge_view_model.dart';
import 'package:workfun_app_teletubbie/view_models/profile/profile_view_model.dart';

import '../view_models/auth/sign_in_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => SignUpViewModel()),
  ChangeNotifierProvider(create: (context) => SignInViewModel()),
  ChangeNotifierProvider(create: (context) => ChallengeViewModel()),
  ChangeNotifierProvider(create: (context) => ProfileViewModel()),
];
