// To parse this JSON data, do
//
//     final createOrderModel = createOrderModelFromJson(jsonString);

import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) =>
    CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) =>
    json.encode(data.toJson());

class CreateOrderModel {
  CreateOrderModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  String success;
  String status;
  String message;
  Data data;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
