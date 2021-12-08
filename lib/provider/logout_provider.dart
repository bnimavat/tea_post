import 'package:flutter/cupertino.dart';

import 'package:tea_post/api/user_services/logout_services.dart';

import 'package:tea_post/model/user/logout_model.dart';

class LogoutProvider with ChangeNotifier {
  LogoutModel? logoutModel;
  bool loading = false;

  logout(context) async {
    loading = true;
    logoutModel = await LogoutServices().logout(context);
    loading = false;

    notifyListeners();
  }
}
