
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:workfun_app_teletubbie/view_models/auth/sign_up_view_model.dart';

List<SingleChildWidget> providers = [
 ChangeNotifierProvider(create: (context) => SignUpViewModel()),
];