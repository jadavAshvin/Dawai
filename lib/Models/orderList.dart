// To parse this JSON data, do
//
//     final orderListResponse = orderListResponseFromMap(jsonString);

import 'dart:convert';

OrderListResponse orderListResponseFromMap(String str) => OrderListResponse.fromMap(json.decode(str));

String orderListResponseToMap(OrderListResponse data) => json.encode(data.toMap());

class OrderListResponse {
  OrderListResponse({
    this.success,
    this.rows,
    this.result,
  });

  String success;
  int rows;
  List<Result> result;

  factory OrderListResponse.fromMap(Map<String, dynamic> json) => OrderListResponse(
    success: json["success"],
    rows: json["rows"],
    result: json["success"] == "true"?
    List<Result>.from(json["result"].map((x) => Result.fromMap(x))): [],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "rows": rows,
    "result": List<dynamic>.from(result.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    this.id,
    this.adminId,
    this.invoiceNo,
    this.addressId,
    this.customerId,
    this.mobileNo,
    this.mrnNo,
    this.nationalId,
    this.firstname,
    this.lastname,
    this.address,
    this.streetName,
    this.wayNumber,
    this.houseBuilding,
    this.appartmentNumber,
    this.city,
    this.governorate,
    this.deliverboyId,
    this.deliveryDate,
    this.deliveryComment,
    this.deliveryStatus,
    this.pharmacyId,
    this.pharmacyName,
    this.pharmacyMobileNo,
    this.clientNote,
    this.termsncondition,
    this.orderStatusId,
    this.orderPlaced,
    this.orderPlacedDate,
    this.deliveredDate,
    this.createdDate,
    this.updatedDate,
    this.languageId,
    this.name,
    this.color,
    this.icon,
    this.orderStatusName,
    this.orderStatusArabic,
    this.colorCode,
  });

  String id;
  String adminId;
  String invoiceNo;
  String addressId;
  String customerId;
  String mobileNo;
  String mrnNo;
  String nationalId;
  String firstname;
  String lastname;
  String address;
  String streetName;
  String wayNumber;
  String houseBuilding;
  String appartmentNumber;
  City city;
  String governorate;
  String deliverboyId;
  DeliveryDate deliveryDate;
  String deliveryComment;
  String deliveryStatus;
  String pharmacyId;
  String pharmacyName;
  String pharmacyMobileNo;
  String clientNote;
  String termsncondition;
  String orderStatusId;
  String orderPlaced;
  EdDate orderPlacedDate;
  EdDate deliveredDate;
  DateTime createdDate;
  dynamic updatedDate;
  String languageId;
  Name name;
  Color color;
  Icon icon;
  String orderStatusName;
  String orderStatusArabic;
  String colorCode;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    adminId: json["admin_id"],
    invoiceNo: json["invoice_no"],
    addressId: json["address_id"],
    customerId: json["customer_id"],
    mobileNo: json["mobile_no"],
    mrnNo: json["mrn_no"],
    nationalId: json["national_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    address: json["address"],
    streetName: json["street_name"],
    wayNumber: json["way_number"],
    houseBuilding: json["house_building"],
    appartmentNumber: json["appartment_number"],
    city: cityValues.map[json["city"]],
    governorate: json["governorate"],
    deliverboyId: json["deliverboy_id"],
    deliveryDate: deliveryDateValues.map[json["delivery_date"]],
    deliveryComment: json["delivery_comment"],
    deliveryStatus: json["delivery_status"],
    pharmacyId: json["pharmacy_id"],
    pharmacyName: json["pharmacy_name"],
    pharmacyMobileNo: json["pharmacy_mobile_no"],
    clientNote: json["client_note"],
    termsncondition: json["termsncondition"],
    orderStatusId: json["order_status_id"],
    orderPlaced: json["order_placed"],
    orderPlacedDate: edDateValues.map[json["order_placed_date"]],
    deliveredDate: edDateValues.map[json["delivered_date"]],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
    languageId: json["language_id"],
    name: nameValues.map[json["name"]],
    color: colorValues.map[json["color"]],
    icon: iconValues.map[json["icon"]],
    orderStatusName: json["order_status_name"],
    orderStatusArabic: json["order_status_arabic"],
    colorCode: json["color_code"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "admin_id": adminId,
    "invoice_no": invoiceNo,
    "address_id": addressId,
    "customer_id": customerId,
    "mobile_no": mobileNo,
    "mrn_no": mrnNo,
    "national_id": nationalId,
    "firstname": firstname,
    "lastname": lastname,
    "address": address,
    "street_name": streetName,
    "way_number": wayNumber,
    "house_building": houseBuilding,
    "appartment_number": appartmentNumber,
    "city": cityValues.reverse[city],
    "governorate": governorate,
    "deliverboy_id": deliverboyId,
    "delivery_date": deliveryDateValues.reverse[deliveryDate],
    "delivery_comment": deliveryComment,
    "delivery_status": deliveryStatus,
    "pharmacy_id": pharmacyId,
    "pharmacy_name": pharmacyName,
    "pharmacy_mobile_no": pharmacyMobileNo,
    "client_note": clientNote,
    "termsncondition": termsncondition,
    "order_status_id": orderStatusId,
    "order_placed": orderPlaced,
    "order_placed_date": edDateValues.reverse[orderPlacedDate],
    "delivered_date": edDateValues.reverse[deliveredDate],
    "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    "updated_date": updatedDate,
    "language_id": languageId,
    "name": nameValues.reverse[name],
    "color": colorValues.reverse[color],
    "icon": iconValues.reverse[icon],
    "order_status_name":orderStatusName,
    "color_code": colorCode,
  };
}

enum City { EMPTY, CITY }

final cityValues = EnumValues({
  "city": City.CITY,
  "": City.EMPTY
});

enum Color { BADGE_DARK, BADGE_PRIMARY, BADGE_SUCCESS }

final colorValues = EnumValues({
  "badge-dark": Color.BADGE_DARK,
  "badge-primary": Color.BADGE_PRIMARY,
  "badge-success": Color.BADGE_SUCCESS
});

enum ColorCode { THE_343_A40, THE_007_BFF, THE_28_A745 }

final colorCodeValues = EnumValues({
  "007BFF": ColorCode.THE_007_BFF,
  "28A745": ColorCode.THE_28_A745,
  "343A40": ColorCode.THE_343_A40
});

enum EdDate { THE_00000000000000 }

final edDateValues = EnumValues({
  "0000-00-00 00:00:00": EdDate.THE_00000000000000
});

enum DeliveryDate { THE_00000000 }

final deliveryDateValues = EnumValues({
  "0000-00-00": DeliveryDate.THE_00000000
});

enum Icon { FA_SHOPPING_CART, FA_TASKS, FA_TRUCK }

final iconValues = EnumValues({
  "fa-shopping-cart": Icon.FA_SHOPPING_CART,
  "fa-tasks": Icon.FA_TASKS,
  "fa-truck": Icon.FA_TRUCK
});

enum Name { SPAN_CLASS_BADGE_BADGE_DARK_ORDER_PLACED_SPAN, SPAN_CLASS_BADGE_BADGE_PRIMARY_UNDER_PROCESS_SPAN, SPAN_CLASS_BADGE_BADGE_SUCCESS_ORDER_DELIVERED_SPAN }

final nameValues = EnumValues({
  "<span class=\"badge badge-dark\">Order Placed</span>": Name.SPAN_CLASS_BADGE_BADGE_DARK_ORDER_PLACED_SPAN,
  "<span class=\"badge badge-primary\">Under Process</span>": Name.SPAN_CLASS_BADGE_BADGE_PRIMARY_UNDER_PROCESS_SPAN,
  "<span class=\"badge badge-success\">Order Delivered</span>": Name.SPAN_CLASS_BADGE_BADGE_SUCCESS_ORDER_DELIVERED_SPAN
});

enum OrderStatusName { ORDER_PLACED, UNDER_PROCESS, ORDER_DELIVERED }

final orderStatusNameValues = EnumValues({
  "Order Delivered": OrderStatusName.ORDER_DELIVERED,
  "Order Placed": OrderStatusName.ORDER_PLACED,
  "Under Process": OrderStatusName.UNDER_PROCESS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
