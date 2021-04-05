// To parse this JSON data, do
//
//     final orderStatusLog = orderStatusLogFromMap(jsonString);

import 'dart:convert';

OrderStatusLog orderStatusLogFromMap(String str) => OrderStatusLog.fromMap(json.decode(str));

String orderStatusLogToMap(OrderStatusLog data) => json.encode(data.toMap());

class OrderStatusLog {
    OrderStatusLog({
        this.success,
        this.rows,
        this.orderstatuslogresult,
    });

    String success;
    int rows;
    List<OrderStatusLogResult> orderstatuslogresult;

    factory OrderStatusLog.fromMap(Map<String, dynamic> json) => OrderStatusLog(
        success: json["success"],
        rows: json["rows"],
        orderstatuslogresult: List<OrderStatusLogResult>.from(json["result"].map((x) => OrderStatusLogResult.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "rows": rows,
        "result": List<dynamic>.from(orderstatuslogresult.map((x) => x.toMap())),
    };
}

class OrderStatusLogResult {
    OrderStatusLogResult({
        this.ciOrdersStatusLogId,
        this.orderId,
        this.orderStatusId,
        this.orderStatusDate,
        this.notDelContent,
        this.languageId,
        this.name,
        this.color,
        this.icon,
        this.orderStatusName,
        this.orderStatusArabic,
        this.colorCode,
    });

    String ciOrdersStatusLogId;
    String orderId;
    String orderStatusId;
    DateTime orderStatusDate;
    String notDelContent;
    String languageId;
    String name;
    String color;
    String icon;
    String orderStatusName;
    String orderStatusArabic;
    String colorCode;

    factory OrderStatusLogResult.fromMap(Map<String, dynamic> json) => OrderStatusLogResult(
        ciOrdersStatusLogId: json["ci_orders_status_log_id"],
        orderId: json["order_id"],
        orderStatusId: json["order_status_id"],
        orderStatusDate: DateTime.parse(json["order_status_date"]),
        notDelContent: json["not_del_content"],
        languageId: json["language_id"],
        name: json["name"],
        color: json["color"],
        icon: json["icon"],
        orderStatusName: json["order_status_name"],
        orderStatusArabic: json["order_status_arabic"],
        colorCode: json["color_code"],
    );

    Map<String, dynamic> toMap() => {
        "ci_orders_status_log_id": ciOrdersStatusLogId,
        "order_id": orderId,
        "order_status_id": orderStatusId,
        "order_status_date": orderStatusDate.toIso8601String(),
        "not_del_content": notDelContent,
        "language_id": languageId,
        "name": name,
        "color": color,
        "icon": icon,
        "order_status_name": orderStatusName,
        "order_status_arabic": orderStatusArabic,
        "color_code": colorCode,
    };
}
