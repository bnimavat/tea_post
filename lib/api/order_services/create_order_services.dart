import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/model/order/create_order_model.dart';
import 'package:http/http.dart' as http;

class CreateOrderServices {
  Future<CreateOrderModel?> createOrderRequest(
      String orderid, String tableid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      final response = await http.post(
        Uri.parse(apiBaseUrl + "api/customer/createOrder"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
            <String, dynamic>{'order_id': orderid, 'table_id': tableid}),
      );
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        // print(jsonData);
        return CreateOrderModel.fromJson(jsonData);
      } else {
        // print('=============some error================');
        return null;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
