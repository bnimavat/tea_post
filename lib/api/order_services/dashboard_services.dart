import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/controller/logout_controller.dart';
import 'package:tea_post/model/order/dashboard_order_model.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  Future<DashboardOrderModel?> getDashboardOrderList(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    try {
      final response = await http.get(
        Uri.parse(apiBaseUrl + "api/customer/get_dashboardData"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        //print(jsonData);
        return DashboardOrderModel.fromJson(jsonData);
      } else if (response.statusCode == 401) {
        await LogoutController.logout();
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (Route<dynamic> route) => false);
      } else {
        //  print('=============some error================');
        throw "something went wrong";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
