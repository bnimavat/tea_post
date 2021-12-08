// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  Data? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"] == null ? "" : json["success"],
        status: json["status"] == null ? "" : json["status"],
        message: json["message"] == null ? "" : json["message"],
        data: json["data"] == null ? Data() : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? Data() : data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.id,
    this.gender,
    this.age,
    this.dob,
    this.name,
    this.email,
    this.countryCode,
    this.mobileNumber,
    this.status,
    this.userType,
  });

  String? token;
  String? id;
  String? gender;
  String? age;
  String? dob;
  String? name;
  String? email;
  String? countryCode;
  String? mobileNumber;
  String? status;
  String? userType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? "" : json["token"],
        id: json["id"] == null ? "" : json["id"],
        gender: json["gender"] == null ? "" : json["gender"],
        age: json["age"] == null ? "" : json["age"],
        dob: json["dob"] == null ? "" : json["dob"],
        name: json["name"] == null ? "" : json["name"],
        email: json["email"] == null ? "" : json["email"],
        countryCode: json["country_code"] == null ? "" : json["country_code"],
        mobileNumber:
            json["mobile_number"] == null ? "" : json["mobile_number"],
        status: json["status"] == null ? "" : json["status"],
        userType: json["user_type"] == null ? "" : json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? "" : token,
        "id": id == null ? "" : id,
        "gender": gender == null ? "" : gender,
        "age": age == null ? "" : age,
        "dob": dob == null ? "" : dob,
        "name": name == null ? "" : name,
        "email": email == null ? "" : email,
        "country_code": countryCode == null ? "" : countryCode,
        "mobile_number": mobileNumber == null ? "" : mobileNumber,
        "status": status == null ? "" : status,
        "user_type": userType == null ? "" : userType,
      };
}
