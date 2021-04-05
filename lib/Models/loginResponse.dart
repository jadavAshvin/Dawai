// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromMap(String str) => LoginResponse.fromMap(json.decode(str));

String loginResponseToMap(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  LoginResponse({
    this.success,
    this.result,
  });

  String success;
  Result result;

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    result: Result.fromMap(json["result"]),
   // result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.customerId,
    this.nationalId,
    this.nationalIdFile,
    this.firstname,
    this.lastname,
    this.email,
    this.mobileNo,
    this.mrnNo,
    this.password,
    this.address,
    this.wayNumber,
    this.streetName,
    this.houseBuilding,
    this.appartmentNumber,
    this.city,
    this.governorate,
    this.nearestLandmark,
    this.role,
    this.isActive,
    this.isVerify,
    this.token,
    this.passwordResetCode,
    this.lastIp,
    this.createdAt,
    this.updatedAt,
    this.otp,
    this.lat_long,
    this.dboyId,
    this.message,
  });

  String customerId;
  String nationalId;
  String nationalIdFile;
  String firstname;
  String lastname;
  String email;
  String mobileNo;
  String mrnNo;
  String password;
  String address;
  String wayNumber;
  String streetName;
  String houseBuilding;
  String appartmentNumber;
  String city;
  String governorate;
  String nearestLandmark;
  String role;
  String isActive;
  String isVerify;
  String token;
  String passwordResetCode;
  String lastIp;
  DateTime createdAt;
  DateTime updatedAt;
  int otp;
  String lat_long;
  String dboyId;
  String message;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    customerId: json["customer_id"],
    nationalId: json["national_id"],
    nationalIdFile: json["national_id_file"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    mobileNo: json["mobile_no"],
    mrnNo: json["mrn_no"],
    password: json["password"],
    address: json["address"],
    wayNumber: json["way_number"],
    streetName: json["street_name"],
    houseBuilding: json["house_building"],
    appartmentNumber: json["appartment_number"],
    city: json["city"],
    governorate: json["governorate"],
    nearestLandmark: json["nearest_landmark"],
    role: json["role"],
    isActive: json["is_active"],
    isVerify: json["is_verify"],
    token: json["token"],
    passwordResetCode: json["password_reset_code"],
    lastIp: json["last_ip"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    otp: json["otp"],
    lat_long: json["lat_long"],
    dboyId: json["dboy_id"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "customer_id": customerId,
    "national_id": nationalId,
    "national_id_file": nationalIdFile,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "mobile_no": mobileNo,
    "mrn_no": mrnNo,
    "password": password,
    "address": address,
    "way_number": wayNumber,
    "street_name": streetName,
    "house_building": houseBuilding,
    "appartment_number": appartmentNumber,
    "city": city,
    "governorate": governorate,
    "nearest_landmark": nearestLandmark,
    "role": role,
    "is_active": isActive,
    "is_verify": isVerify,
    "token": token,
    "password_reset_code": passwordResetCode,
    "last_ip": lastIp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "otp": otp,
    "lat_long": lat_long,
    "dboy_id": dboyId,
    "message": message,
  };
}
