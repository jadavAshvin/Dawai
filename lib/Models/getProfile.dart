// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromMap(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromMap(String str) => GetProfileResponse.fromMap(json.decode(str));

String getProfileResponseToMap(GetProfileResponse data) => json.encode(data.toMap());

class GetProfileResponse {
  GetProfileResponse({
    this.success,
    this.getprofileresult,
  });

  String success;
  List<GetProfileResult> getprofileresult;

  factory GetProfileResponse.fromMap(Map<String, dynamic> json) => GetProfileResponse(
        success: json["success"],
        getprofileresult: List<GetProfileResult>.from(json["result"].map((x) => GetProfileResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": List<dynamic>.from(getprofileresult.map((x) => x.toMap())),
      };
}

class GetProfileResult {
  GetProfileResult(
      {this.customerId,
      this.nationalId,
      this.nationalIdFile,
      this.emailId,
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
      this.latLong,
      this.profileImage,
      this.role,
      this.isActive,
      this.isVerify,
      this.token,
      this.passwordResetCode,
      this.lastIp,
      this.createdAt,
      this.updatedAt,
      this.otp,
      this.isMverify,
      this.privacyPolicyAgree,
      this.cityArabic
      });

  String customerId;
  String nationalId;
  String nationalIdFile;
  String emailId;
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
  String latLong;
  String profileImage;
  String role;
  String isActive;
  String isVerify;
  String token;
  String passwordResetCode;
  String lastIp;
  DateTime createdAt;
  DateTime updatedAt;
  String otp;
  String isMverify;
  String privacyPolicyAgree;
  String cityArabic;

  factory GetProfileResult.fromMap(Map<String, dynamic> json) => GetProfileResult(
        customerId: json["customer_id"],
        nationalId: json["national_id"],
        nationalIdFile: json["national_id_file"],
        emailId: json["email_id"],
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
        latLong: json["lat_long"],
        profileImage: json["profile_image"],
        role: json["role"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        token: json["token"],
        passwordResetCode: json["password_reset_code"],
        lastIp: json["last_ip"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        otp: json["otp"],
        isMverify: json["is_mverify"],
        privacyPolicyAgree: json["privacy_policy_agree"],
      );

  Map<String, dynamic> toMap() => {
        "customer_id": customerId,
        "national_id": nationalId,
        "national_id_file": nationalIdFile,
        "email_id": emailId,
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
        "lat_long": latLong,
        "profile_image": profileImage,
        "role": role,
        "is_active": isActive,
        "is_verify": isVerify,
        "token": token,
        "password_reset_code": passwordResetCode,
        "last_ip": lastIp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "otp": otp,
        "is_mverify": isMverify,
      };
}
