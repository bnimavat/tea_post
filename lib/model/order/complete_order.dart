// To parse this JSON data, do
//
//     final completeOrderModel = completeOrderModelFromJson(jsonString);

import 'dart:convert';

CompleteOrderModel completeOrderModelFromJson(String str) =>
    CompleteOrderModel.fromJson(json.decode(str));

String completeOrderModelToJson(CompleteOrderModel data) =>
    json.encode(data.toJson());

class CompleteOrderModel {
  CompleteOrderModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  String success;
  String status;
  String message;
  Data data;

  factory CompleteOrderModel.fromJson(Map<String, dynamic> json) =>
      CompleteOrderModel(
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
