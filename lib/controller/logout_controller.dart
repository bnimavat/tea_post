import 'package:shared_preferences/shared_preferences.dart';

class LogoutController {
  static Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
  }
}
