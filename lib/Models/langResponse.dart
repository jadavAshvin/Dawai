// To parse this JSON data, do
//
//     final langData = langDataFromMap(jsonString);

import 'dart:convert';

LangData langDataFromMap(String str) => LangData.fromMap(json.decode(str));

String langDataToMap(LangData data) => json.encode(data.toMap());

class LangData {
  LangData({
    this.language,
  });

  List<Language> language;

  factory LangData.fromMap(Map<String, dynamic> json) => LangData(
    language: List<Language>.from(json["language"].map((x) => Language.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "language": List<dynamic>.from(language.map((x) => x.toMap())),
  };
}

class Language {
  Language({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Language.fromMap(Map<String, dynamic> json) => Language(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "value": value,
  };
}
