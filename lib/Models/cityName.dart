// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromMap(jsonString);

import 'dart:convert';

CityResponse cityResponseFromMap(String str) => CityResponse.fromMap(json.decode(str));

String cityResponseToMap(CityResponse data) => json.encode(data.toMap());

class CityResponse {
    CityResponse({
        this.success,
        this.result,
    });

    String success;
    List<Result> result;

    factory CityResponse.fromMap(Map<String, dynamic> json) => CityResponse(
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
        this.id,
        this.abName,
        this.name,
        this.stateId,
    });

    String id;
    String abName;
    String name;
    String stateId;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        abName: json["ab_name"],
        name: json["name"],
        stateId: json["state_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "ab_name": abName,
        "name": name,
        "state_id": stateId,
    };
}
