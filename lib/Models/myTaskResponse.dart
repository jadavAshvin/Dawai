// To parse this JSON data, do
//
//     final taskResponse = taskResponseFromMap(jsonString);

import 'dart:convert';

TaskResponse taskResponseFromMap(String str) => TaskResponse.fromMap(json.decode(str));

String taskResponseToMap(TaskResponse data) => json.encode(data.toMap());

class TaskResponse {
  TaskResponse({
    this.success,
    this.rows,
    this.result,
  });

  String success;
  int rows;
  Result result;

  factory TaskResponse.fromMap(Map<String, dynamic> json) => TaskResponse(
    success: json["success"],
    rows: json["rows"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "rows": rows,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.resultNew,
    this.pending,
    this.message,
  });

  int resultNew;
  int pending;
  String message;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    resultNew: json["new"],
    pending: json["pending"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "new": resultNew,
    "pending": pending,
    "message": message,
  };
}
