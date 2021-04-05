// To parse this JSON data, do
//
//     final medicalPharmacyResponse = medicalPharmacyResponseFromMap(jsonString);

import 'dart:convert';

MedicalPharmacyResponse medicalPharmacyResponseFromMap(String str) => MedicalPharmacyResponse.fromMap(json.decode(str));

String medicalPharmacyResponseToMap(MedicalPharmacyResponse data) => json.encode(data.toMap());

class MedicalPharmacyResponse {
  MedicalPharmacyResponse({
    this.success,
    this.pickupRows,
    this.resultpickup,
    this.resultpendingpickup,
    this.pendingPickuprows,
    this.message,
  });

  String success;
  String pickupRows;
  List<Map<String, String>> resultpickup;
  List<Map<String, String>> resultpendingpickup;
  String pendingPickuprows;
  String message;

  factory MedicalPharmacyResponse.fromMap(Map<String, dynamic> json) => MedicalPharmacyResponse(
    success: json["success"],
    pickupRows: json["pickupRows"],
    resultpickup: List<Map<String, String>>.from(json["resultpickup"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    resultpendingpickup: List<Map<String, String>>.from(json["resultpendingpickup"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    pendingPickuprows: json["pendingPickuprows"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "pickupRows": pickupRows,
    "resultpickup": List<dynamic>.from(resultpickup.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    "resultpendingpickup": List<dynamic>.from(resultpendingpickup.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    "pendingPickuprows": pendingPickuprows,
    "message": message,
  };
}
