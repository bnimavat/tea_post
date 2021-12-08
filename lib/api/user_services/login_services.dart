import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/model/user/login_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginResponseModel?> loginRequest(
      String token, String password, String phone) async {
    try {
      final response = await http.post(
        Uri.parse(apiBaseUrl + "api/customer/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'device_token': token,
          'password': password,
          'mobile_number': phone
        }),
      );
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(jsonData);
      } else {
        // print('=============some error================');
        return null;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
