// To parse this JSON data, do
//
//     final orderDetailsResponse = orderDetailsResponseFromMap(jsonString);

import 'dart:convert';
class OrderDetailsResponse {
  String success;
  int rows;
  List<Result> result;

  OrderDetailsResponse({this.success, this.rows, this.result});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    rows = json['rows'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['rows'] = this.rows;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
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
  String createdDate;
  Null updatedDate;
  String languageId;
  String name;
  String color;
  String icon;
  String orderStatusName;
  String colorCode;
  String nationalIdFile;
  String email;
  String password;
  String nearestLandmark;
  String latLong;
  String role;
  String isActive;
  String isVerify;
  String token;
  String passwordResetCode;
  String lastIp;
  String createdAt;
  String updatedAt;
  String otp;

  Result(
      {this.id,
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
        this.colorCode,
        this.nationalIdFile,
        this.email,
        this.password,
        this.nearestLandmark,
        this.latLong,
        this.role,
        this.isActive,
        this.isVerify,
        this.token,
        this.passwordResetCode,
        this.lastIp,
        this.createdAt,
        this.updatedAt,
        this.otp});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    invoiceNo = json['invoice_no'];
    addressId = json['address_id'];
    customerId = json['customer_id'];
    mobileNo = json['mobile_no'];
    mrnNo = json['mrn_no'];
    nationalId = json['national_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    address = json['address'];
    streetName = json['street_name'];
    wayNumber = json['way_number'];
    houseBuilding = json['house_building'];
    appartmentNumber = json['appartment_number'];
    city = json['city'];
    governorate = json['governorate'];
    deliverboyId = json['deliverboy_id'];
    deliveryDate = json['delivery_date'];
    deliveryComment = json['delivery_comment'];
    deliveryStatus = json['delivery_status'];
    pharmacyId = json['pharmacy_id'];
    pharmacyName = json['pharmacy_name'];
    pharmacyMobileNo = json['pharmacy_mobile_no'];
    clientNote = json['client_note'];
    termsncondition = json['termsncondition'];
    orderStatusId = json['order_status_id'];
    orderPlaced = json['order_placed'];
    orderPlacedDate = json['order_placed_date'];
    deliveredDate = json['delivered_date'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    languageId = json['language_id'];
    name = json['name'];
    color = json['color'];
    icon = json['icon'];
    orderStatusName = json['order_status_name'];
    colorCode = json['color_code'];
    nationalIdFile = json['national_id_file'];
    email = json['email'];
    password = json['password'];
    nearestLandmark = json['nearest_landmark'];
    latLong = json['lat_long'];
    role = json['role'];
    isActive = json['is_active'];
    isVerify = json['is_verify'];
    token = json['token'];
    passwordResetCode = json['password_reset_code'];
    lastIp = json['last_ip'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['invoice_no'] = this.invoiceNo;
    data['address_id'] = this.addressId;
    data['customer_id'] = this.customerId;
    data['mobile_no'] = this.mobileNo;
    data['mrn_no'] = this.mrnNo;
    data['national_id'] = this.nationalId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['address'] = this.address;
    data['street_name'] = this.streetName;
    data['way_number'] = this.wayNumber;
    data['house_building'] = this.houseBuilding;
    data['appartment_number'] = this.appartmentNumber;
    data['city'] = this.city;
    data['governorate'] = this.governorate;
    data['deliverboy_id'] = this.deliverboyId;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_comment'] = this.deliveryComment;
    data['delivery_status'] = this.deliveryStatus;
    data['pharmacy_id'] = this.pharmacyId;
    data['pharmacy_name'] = this.pharmacyName;
    data['pharmacy_mobile_no'] = this.pharmacyMobileNo;
    data['client_note'] = this.clientNote;
    data['termsncondition'] = this.termsncondition;
    data['order_status_id'] = this.orderStatusId;
    data['order_placed'] = this.orderPlaced;
    data['order_placed_date'] = this.orderPlacedDate;
    data['delivered_date'] = this.deliveredDate;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['language_id'] = this.languageId;
    data['name'] = this.name;
    data['color'] = this.color;
    data['icon'] = this.icon;
    data['order_status_name'] = this.orderStatusName;
    data['color_code'] = this.colorCode;
    data['national_id_file'] = this.nationalIdFile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['nearest_landmark'] = this.nearestLandmark;
    data['lat_long'] = this.latLong;
    data['role'] = this.role;
    data['is_active'] = this.isActive;
    data['is_verify'] = this.isVerify;
    data['token'] = this.token;
    data['password_reset_code'] = this.passwordResetCode;
    data['last_ip'] = this.lastIp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['otp'] = this.otp;
    return data;
  }
}

/*
OrderDetailsResponse orderDetailsResponseFromMap(String str) => OrderDetailsResponse.fromMap(json.decode(str));

String orderDetailsResponseToMap(OrderDetailsResponse data) => json.encode(data.toMap());

class OrderDetailsResponse {
  OrderDetailsResponse({
    this.success,
    this.rows,
    this.result,
  });

  String success;
  int rows;
  List<Result> result;

  factory OrderDetailsResponse.fromMap(Map<String, dynamic> json) => OrderDetailsResponse(
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
    "color_code": colorCode,
  };
}
*/
