// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromMap(jsonString);

import 'dart:convert';

OrderResponse orderResponseFromMap(String str) => OrderResponse.fromMap(json.decode(str));

String orderResponseToMap(OrderResponse data) => json.encode(data.toMap());

class OrderResponse {
  OrderResponse({
    this.success,
    this.result,
  });

  String success;
  Result result;

  factory OrderResponse.fromMap(Map<String, dynamic> json) => OrderResponse(
    success: json["success"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.message,
    this.orderNo,
    this.orderDate,
  });

  String message;
  String orderNo;
  DateTime orderDate;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    message: json["message"],
    orderNo: json["order_no"],
    orderDate: DateTime.parse(json["order_date"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "order_no": orderNo,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
  };
}
