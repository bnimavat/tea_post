// To parse this JSON data, do
//
//     final dashboardOrderModel = dashboardOrderModelFromJson(jsonString);

import 'dart:convert';

DashboardOrderModel dashboardOrderModelFromJson(String str) =>
    DashboardOrderModel.fromJson(json.decode(str));

String dashboardOrderModelToJson(DashboardOrderModel data) =>
    json.encode(data.toJson());

class DashboardOrderModel {
  DashboardOrderModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  String success;
  String status;
  String message;
  List<Datum> data;

  factory DashboardOrderModel.fromJson(Map<String, dynamic> json) =>
      DashboardOrderModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.customOrderId,
    required this.tableId,
    required this.status,
  });

  String id;
  String customOrderId;
  String tableId;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customOrderId: json["custom_order_id"],
        tableId: json["table_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_order_id": customOrderId,
        "table_id": tableId,
        "status": status,
      };
}
