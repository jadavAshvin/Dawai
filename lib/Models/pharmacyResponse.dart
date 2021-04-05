// To parse this JSON data, do
//
//     final pharmacyResponse = pharmacyResponseFromMap(jsonString);

import 'dart:convert';

PharmacyResponse pharmacyResponseFromMap(String str) => PharmacyResponse.fromMap(json.decode(str));

String pharmacyResponseToMap(PharmacyResponse data) => json.encode(data.toMap());

class PharmacyResponse {
  PharmacyResponse({
    this.success,
    this.result,
  });

  String success;
  List<Result> result;

  factory PharmacyResponse.fromMap(Map<String, dynamic> json) => PharmacyResponse(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    this.pharmacyId,
    this.pharmacyname,
    this.pharmacynameAb,
    this.latLong,
  });

  String pharmacyId;
  String pharmacyname;
  String pharmacynameAb;
  String latLong;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    pharmacyId: json["pharmacy_id"],
    pharmacyname: json["pharmacyname"],
    pharmacynameAb: json["pharmacyname_ab"],
    latLong: json["lat_long"],
  );

  Map<String, dynamic> toMap() => {
    "pharmacy_id": pharmacyId,
    "pharmacyname": pharmacyname,
    "pharmacyname_ab": pharmacynameAb,
    "lat_long": latLong,
  };
}
