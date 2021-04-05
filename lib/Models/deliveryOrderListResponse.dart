// To parse this JSON data, do
//
//     final deliveryOrderListResponse = deliveryOrderListResponseFromMap(jsonString);

import 'dart:convert';

DeliveryOrderListResponse deliveryOrderListResponseFromMap(String str) => DeliveryOrderListResponse.fromMap(json.decode(str));

String deliveryOrderListResponseToMap(DeliveryOrderListResponse data) => json.encode(data.toMap());

class DeliveryOrderListResponse {
  DeliveryOrderListResponse({
    this.success,
    this.rows,
    this.result,
  });

  String success;
  int rows;
  List<Result> result;

  factory DeliveryOrderListResponse.fromMap(Map<String, dynamic> json) => DeliveryOrderListResponse(
    success: json["success"],
    rows: json["rows"],
    result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
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
  String city;
  String governorate;
  String deliverboyId;
  String deliveryDate;
  String deliveryComment;
  String deliveryStatus;
  String pharmacyId;
  String pharmacyName;
  String pharmacyMobileNo;
  String clientNote;
  String termsncondition;
  String orderStatusId;
  String orderPlaced;
  String orderPlacedDate;
  String deliveredDate;
  DateTime createdDate;
  dynamic updatedDate;
  String languageId;
  String name;
  String color;
  String icon;
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
    city: json["city"],
    governorate: json["governorate"],
    deliverboyId: json["deliverboy_id"],
    deliveryDate: json["delivery_date"],
    deliveryComment: json["delivery_comment"],
    deliveryStatus: json["delivery_status"],
    pharmacyId: json["pharmacy_id"],
    pharmacyName: json["pharmacy_name"],
    pharmacyMobileNo: json["pharmacy_mobile_no"],
    clientNote: json["client_note"],
    termsncondition: json["termsncondition"],
    orderStatusId: json["order_status_id"],
    orderPlaced: json["order_placed"],
    orderPlacedDate: json["order_placed_date"],
    deliveredDate: json["delivered_date"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
    languageId: json["language_id"],
    name: json["name"],
    color: json["color"],
    icon: json["icon"],
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
    "city": city,
    "governorate": governorate,
    "deliverboy_id": deliverboyId,
    "delivery_date": deliveryDate,
    "delivery_comment": deliveryComment,
    "delivery_status": deliveryStatus,
    "pharmacy_id": pharmacyId,
    "pharmacy_name": pharmacyName,
    "pharmacy_mobile_no": pharmacyMobileNo,
    "client_note": clientNote,
    "termsncondition": termsncondition,
    "order_status_id": orderStatusId,
    "order_placed": orderPlaced,
    "order_placed_date": orderPlacedDate,
    "delivered_date": deliveredDate,
    "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    "updated_date": updatedDate,
    "language_id": languageId,
    "name": name,
    "color": color,
    "icon": icon,
    "order_status_name": orderStatusName,
    "order_status_arabic": orderStatusArabic,
    "color_code": colorCode,
  };
}
