// To parse this JSON data, do
//
//     final pharmacy = pharmacyFromJson(jsonString);

import 'dart:convert';

Pharmacy pharmacyFromJson(String str) => Pharmacy.fromJson(json.decode(str));

String pharmacyToJson(Pharmacy data) => json.encode(data.toJson());

class Pharmacy {
    Pharmacy({
        this.success,
        this.pharmacyResult,
    });

    String success;
    List<PharmacyResult> pharmacyResult;

    factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        success: json["success"],
        pharmacyResult: List<PharmacyResult>.from(json["result"].map((x) => PharmacyResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "PharmacyResult": List<dynamic>.from(pharmacyResult.map((x) => x.toJson())),
    };
}


class PharmacyResult {
    PharmacyResult({
        this.pharmacyId,
        this.pharmacyname,
        this.latLong,
    });

    String pharmacyId;
    String pharmacyname;
    String latLong;

    factory PharmacyResult.fromJson(Map<String, dynamic> json) => PharmacyResult(
        pharmacyId: json["pharmacy_id"],
        pharmacyname: json["pharmacyname"],
        latLong: json["lat_long"],
    );

    Map<String, dynamic> toJson() => {
        "pharmacy_id": pharmacyId,
        "pharmacyname": pharmacyname,
        "lat_long": latLong,
    };
}
