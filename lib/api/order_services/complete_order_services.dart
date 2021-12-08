import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/model/order/complete_order.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CompleteOrderService {
  Future<CompleteOrderModel?> completeOrderRequest(
    String id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      final response = await http.post(
        Uri.parse(apiBaseUrl + "api/customer/completeOrder"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
        }),
      );
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
       // print(jsonData);
        return CompleteOrderModel.fromJson(jsonData);
      }
      
       else {
        // print('=============some error================');
        return null;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
