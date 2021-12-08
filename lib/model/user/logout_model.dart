// To parse this JSON data, do
//
//     final logoutModel = logoutModelFromJson(jsonString);

import 'dart:convert';

LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));

String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
    LogoutModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    String success;
    String status;
    String message;
    Data data;

    factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}
