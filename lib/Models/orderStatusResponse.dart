// To parse this JSON data, do
//
//     final orderStatusResponse = orderStatusResponseFromMap(jsonString);

import 'dart:convert';

OrderStatusResponse orderStatusResponseFromMap(String str) => OrderStatusResponse.fromMap(json.decode(str));

String orderStatusResponseToMap(OrderStatusResponse data) => json.encode(data.toMap());

class OrderStatusResponse {
  OrderStatusResponse({
    this.success,
    this.result,
  });

  String success;
  List<Result> result;

  factory OrderStatusResponse.fromMap(Map<String, dynamic> json) => OrderStatusResponse(
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
    this.orderStatusId,
    this.languageId,
    this.name,
    this.color,
    this.icon,
    this.orderStatusName,
    this.orderStatusArabic,
    this.colorCode,
  });

  String orderStatusId;
  String languageId;
  String name;
  String color;
  String icon;
  String orderStatusName;
  String orderStatusArabic;
  String colorCode;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    orderStatusId: json["order_status_id"],
    languageId: json["language_id"],
    name: json["name"],
    color: json["color"],
    icon: json["icon"],
    orderStatusName: json["order_status_name"],
    orderStatusArabic: json["order_status_arabic"],
    colorCode: json["color_code"],
  );

  Map<String, dynamic> toMap() => {
    "order_status_id": orderStatusId,
    "language_id": languageId,
    "name": name,
    "color": color,
    "icon": icon,
    "order_status_name": orderStatusName,
    "order_status_arabic": orderStatusArabic,
    "color_code": colorCode,
  };
}
