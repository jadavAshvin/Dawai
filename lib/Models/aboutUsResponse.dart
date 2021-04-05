// To parse this JSON data, do
//
//     final aboutUsResponseResponse = aboutUsResponseResponseFromMap(jsonString);

import 'dart:convert';

AboutUsResponseResponse aboutUsResponseResponseFromMap(String str) => AboutUsResponseResponse.fromMap(json.decode(str));

String aboutUsResponseResponseToMap(AboutUsResponseResponse data) => json.encode(data.toMap());

class AboutUsResponseResponse {
  AboutUsResponseResponse({
    this.success,
    this.result,
  });

  String success;
  List<Result> result;

  factory AboutUsResponseResponse.fromMap(Map<String, dynamic> json) => AboutUsResponseResponse(
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
    this.cmsId,
    this.languageId,
    this.shortName,
    this.cmsName,
    this.cmsContent,
    this.status,
  });

  String cmsId;
  String languageId;
  String shortName;
  String cmsName;
  String cmsContent;
  String status;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    cmsId: json["cms_id"],
    languageId: json["language_id"],
    shortName: json["short_name"],
    cmsName: json["cms_name"],
    cmsContent: json["cms_content"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "cms_id": cmsId,
    "language_id": languageId,
    "short_name": shortName,
    "cms_name": cmsName,
    "cms_content": cmsContent,
    "status": status,
  };
}
