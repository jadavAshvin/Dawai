/// success : "true"
/// rows : 1
/// result : [{"id":"90","admin_id":"0","invoice_no":"ORD90","address_id":"","customer_id":"1","mobile_no":"7815057500","mrn_no":"2147483647","national_id":"10089-123","firstname":"Raj","lastname":"Obrey","address":" sdfasdfadsadsfasd123","street_name":"Stree name123","way_number":"way number","house_building":"Hosue Building123","appartment_number":"Appartment number123","city":"as-Sib","governorate":"governorate123","deliverboy_id":"1","delivery_date":"0000-00-00","delivery_comment":"","delivery_status":"","pharmacy_id":"1","pharmacy_name":"","pharmacy_mobile_no":"","client_note":"gghhhhh hjkhhh","termsncondition":"","order_status_id":"2","order_placed":"0","order_placed_date":"0000-00-00 00:00:00","delivered_date":"0000-00-00 00:00:00","created_date":"2020-12-26","updated_date":null,"language_id":"1","name":"<span class=\"badge badge-dark\">Order Placed</span>","color":"badge-dark","icon":"fa-shopping-cart","order_status_name":"Order Placed","color_code":"343A40","national_id_file":"","email":"rajobrey@gmail.com","password":"asdfadsfasfasa","nearest_landmark":"aj","lat_long":"19.3582493,84.9936173","role":"1","is_active":"1","is_verify":"1","token":"adfdasfads","password_reset_code":"","last_ip":"","created_at":"2020-11-01 14:19:21","updated_at":"2020-12-27 06:08:18","otp":"7168"}]

class OrderDetailsAllResponse {
  String _success;
  int _rows;
  List<Result> _result;

  String get success => _success;
  int get rows => _rows;
  List<Result> get result => _result;

  OrderDetailsAllResponse({
      String success, 
      int rows, 
      List<Result> result}){
    _success = success;
    _rows = rows;
    _result = result;
}

  OrderDetailsAllResponse.fromJson(dynamic json) {
    _success = json["success"];
    _rows = json["rows"];
    if (json["result"] != null) {
      _result = [];
      json["result"].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    map["rows"] = _rows;
    if (_result != null) {
      map["result"] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "90"
/// admin_id : "0"
/// invoice_no : "ORD90"
/// address_id : ""
/// customer_id : "1"
/// mobile_no : "7815057500"
/// mrn_no : "2147483647"
/// national_id : "10089-123"
/// firstname : "Raj"
/// lastname : "Obrey"
/// address : " sdfasdfadsadsfasd123"
/// street_name : "Stree name123"
/// way_number : "way number"
/// house_building : "Hosue Building123"
/// appartment_number : "Appartment number123"
/// city : "as-Sib"
/// governorate : "governorate123"
/// deliverboy_id : "1"
/// delivery_date : "0000-00-00"
/// delivery_comment : ""
/// delivery_status : ""
/// pharmacy_id : "1"
/// pharmacy_name : ""
/// pharmacy_mobile_no : ""
/// client_note : "gghhhhh hjkhhh"
/// termsncondition : ""
/// order_status_id : "2"
/// order_placed : "0"
/// order_placed_date : "0000-00-00 00:00:00"
/// delivered_date : "0000-00-00 00:00:00"
/// created_date : "2020-12-26"
/// updated_date : null
/// language_id : "1"
/// name : "<span class=\"badge badge-dark\">Order Placed</span>"
/// color : "badge-dark"
/// icon : "fa-shopping-cart"
/// order_status_name : "Order Placed"
/// color_code : "343A40"
/// national_id_file : ""
/// email : "rajobrey@gmail.com"
/// password : "asdfadsfasfasa"
/// nearest_landmark : "aj"
/// lat_long : "19.3582493,84.9936173"
/// role : "1"
/// is_active : "1"
/// is_verify : "1"
/// token : "adfdasfads"
/// password_reset_code : ""
/// last_ip : ""
/// created_at : "2020-11-01 14:19:21"
/// updated_at : "2020-12-27 06:08:18"
/// otp : "7168"

class Result {
  String _id;
  String _adminId;
  String _invoiceNo;
  String _addressId;
  String _customerId;
  String _mobileNo;
  String _mrnNo;
  String _nationalId;
  String _firstname;
  String _lastname;
  String _address;
  String _streetName;
  String _wayNumber;
  String _houseBuilding;
  String _appartmentNumber;
  String _city;
  String _governorate;
  String _deliverboyId;
  String _deliveryDate;
  String _deliveryComment;
  String _deliveryStatus;
  String _pharmacyId;
  String _pharmacyName;
  String _pharmacyMobileNo;
  String _clientNote;
  String _termsncondition;
  String _orderStatusId;
  String _orderPlaced;
  String _orderPlacedDate;
  String _deliveredDate;
  String _createdDate;
  dynamic _updatedDate;
  String _languageId;
  String _name;
  String _color;
  String _icon;
  String _orderStatusName;
  String _colorCode;
  String _nationalIdFile;
  String _email;
  String _password;
  String _nearestLandmark;
  String _latLong;
  String _role;
  String _isActive;
  String _isVerify;
  String _token;
  String _passwordResetCode;
  String _lastIp;
  String _createdAt;
  String _updatedAt;
  String _otp;

  String get id => _id;
  String get adminId => _adminId;
  String get invoiceNo => _invoiceNo;
  String get addressId => _addressId;
  String get customerId => _customerId;
  String get mobileNo => _mobileNo;
  String get mrnNo => _mrnNo;
  String get nationalId => _nationalId;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get address => _address;
  String get streetName => _streetName;
  String get wayNumber => _wayNumber;
  String get houseBuilding => _houseBuilding;
  String get appartmentNumber => _appartmentNumber;
  String get city => _city;
  String get governorate => _governorate;
  String get deliverboyId => _deliverboyId;
  String get deliveryDate => _deliveryDate;
  String get deliveryComment => _deliveryComment;
  String get deliveryStatus => _deliveryStatus;
  String get pharmacyId => _pharmacyId;
  String get pharmacyName => _pharmacyName;
  String get pharmacyMobileNo => _pharmacyMobileNo;
  String get clientNote => _clientNote;
  String get termsncondition => _termsncondition;
  String get orderStatusId => _orderStatusId;
  String get orderPlaced => _orderPlaced;
  String get orderPlacedDate => _orderPlacedDate;
  String get deliveredDate => _deliveredDate;
  String get createdDate => _createdDate;
  dynamic get updatedDate => _updatedDate;
  String get languageId => _languageId;
  String get name => _name;
  String get color => _color;
  String get icon => _icon;
  String get orderStatusName => _orderStatusName;
  String get colorCode => _colorCode;
  String get nationalIdFile => _nationalIdFile;
  String get email => _email;
  String get password => _password;
  String get nearestLandmark => _nearestLandmark;
  String get latLong => _latLong;
  String get role => _role;
  String get isActive => _isActive;
  String get isVerify => _isVerify;
  String get token => _token;
  String get passwordResetCode => _passwordResetCode;
  String get lastIp => _lastIp;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get otp => _otp;

  Result({
      String id, 
      String adminId, 
      String invoiceNo, 
      String addressId, 
      String customerId, 
      String mobileNo, 
      String mrnNo, 
      String nationalId, 
      String firstname, 
      String lastname, 
      String address, 
      String streetName, 
      String wayNumber, 
      String houseBuilding, 
      String appartmentNumber, 
      String city, 
      String governorate, 
      String deliverboyId, 
      String deliveryDate, 
      String deliveryComment, 
      String deliveryStatus, 
      String pharmacyId, 
      String pharmacyName, 
      String pharmacyMobileNo, 
      String clientNote, 
      String termsncondition, 
      String orderStatusId, 
      String orderPlaced, 
      String orderPlacedDate, 
      String deliveredDate, 
      String createdDate, 
      dynamic updatedDate, 
      String languageId, 
      String name, 
      String color, 
      String icon, 
      String orderStatusName, 
      String colorCode, 
      String nationalIdFile, 
      String email, 
      String password, 
      String nearestLandmark, 
      String latLong, 
      String role, 
      String isActive, 
      String isVerify, 
      String token, 
      String passwordResetCode, 
      String lastIp, 
      String createdAt, 
      String updatedAt, 
      String otp}){
    _id = id;
    _adminId = adminId;
    _invoiceNo = invoiceNo;
    _addressId = addressId;
    _customerId = customerId;
    _mobileNo = mobileNo;
    _mrnNo = mrnNo;
    _nationalId = nationalId;
    _firstname = firstname;
    _lastname = lastname;
    _address = address;
    _streetName = streetName;
    _wayNumber = wayNumber;
    _houseBuilding = houseBuilding;
    _appartmentNumber = appartmentNumber;
    _city = city;
    _governorate = governorate;
    _deliverboyId = deliverboyId;
    _deliveryDate = deliveryDate;
    _deliveryComment = deliveryComment;
    _deliveryStatus = deliveryStatus;
    _pharmacyId = pharmacyId;
    _pharmacyName = pharmacyName;
    _pharmacyMobileNo = pharmacyMobileNo;
    _clientNote = clientNote;
    _termsncondition = termsncondition;
    _orderStatusId = orderStatusId;
    _orderPlaced = orderPlaced;
    _orderPlacedDate = orderPlacedDate;
    _deliveredDate = deliveredDate;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _languageId = languageId;
    _name = name;
    _color = color;
    _icon = icon;
    _orderStatusName = orderStatusName;
    _colorCode = colorCode;
    _nationalIdFile = nationalIdFile;
    _email = email;
    _password = password;
    _nearestLandmark = nearestLandmark;
    _latLong = latLong;
    _role = role;
    _isActive = isActive;
    _isVerify = isVerify;
    _token = token;
    _passwordResetCode = passwordResetCode;
    _lastIp = lastIp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _otp = otp;
}

  Result.fromJson(dynamic json) {
    _id = json["id"];
    _adminId = json["admin_id"];
    _invoiceNo = json["invoice_no"];
    _addressId = json["address_id"];
    _customerId = json["customer_id"];
    _mobileNo = json["mobile_no"];
    _mrnNo = json["mrn_no"];
    _nationalId = json["national_id"];
    _firstname = json["firstname"];
    _lastname = json["lastname"];
    _address = json["address"];
    _streetName = json["street_name"];
    _wayNumber = json["way_number"];
    _houseBuilding = json["house_building"];
    _appartmentNumber = json["appartment_number"];
    _city = json["city"];
    _governorate = json["governorate"];
    _deliverboyId = json["deliverboy_id"];
    _deliveryDate = json["delivery_date"];
    _deliveryComment = json["delivery_comment"];
    _deliveryStatus = json["delivery_status"];
    _pharmacyId = json["pharmacy_id"];
    _pharmacyName = json["pharmacy_name"];
    _pharmacyMobileNo = json["pharmacy_mobile_no"];
    _clientNote = json["client_note"];
    _termsncondition = json["termsncondition"];
    _orderStatusId = json["order_status_id"];
    _orderPlaced = json["order_placed"];
    _orderPlacedDate = json["order_placed_date"];
    _deliveredDate = json["delivered_date"];
    _createdDate = json["created_date"];
    _updatedDate = json["updated_date"];
    _languageId = json["language_id"];
    _name = json["name"];
    _color = json["color"];
    _icon = json["icon"];
    _orderStatusName = json["order_status_name"];
    _colorCode = json["color_code"];
    _nationalIdFile = json["national_id_file"];
    _email = json["email"];
    _password = json["password"];
    _nearestLandmark = json["nearest_landmark"];
    _latLong = json["lat_long"];
    _role = json["role"];
    _isActive = json["is_active"];
    _isVerify = json["is_verify"];
    _token = json["token"];
    _passwordResetCode = json["password_reset_code"];
    _lastIp = json["last_ip"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _otp = json["otp"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["admin_id"] = _adminId;
    map["invoice_no"] = _invoiceNo;
    map["address_id"] = _addressId;
    map["customer_id"] = _customerId;
    map["mobile_no"] = _mobileNo;
    map["mrn_no"] = _mrnNo;
    map["national_id"] = _nationalId;
    map["firstname"] = _firstname;
    map["lastname"] = _lastname;
    map["address"] = _address;
    map["street_name"] = _streetName;
    map["way_number"] = _wayNumber;
    map["house_building"] = _houseBuilding;
    map["appartment_number"] = _appartmentNumber;
    map["city"] = _city;
    map["governorate"] = _governorate;
    map["deliverboy_id"] = _deliverboyId;
    map["delivery_date"] = _deliveryDate;
    map["delivery_comment"] = _deliveryComment;
    map["delivery_status"] = _deliveryStatus;
    map["pharmacy_id"] = _pharmacyId;
    map["pharmacy_name"] = _pharmacyName;
    map["pharmacy_mobile_no"] = _pharmacyMobileNo;
    map["client_note"] = _clientNote;
    map["termsncondition"] = _termsncondition;
    map["order_status_id"] = _orderStatusId;
    map["order_placed"] = _orderPlaced;
    map["order_placed_date"] = _orderPlacedDate;
    map["delivered_date"] = _deliveredDate;
    map["created_date"] = _createdDate;
    map["updated_date"] = _updatedDate;
    map["language_id"] = _languageId;
    map["name"] = _name;
    map["color"] = _color;
    map["icon"] = _icon;
    map["order_status_name"] = _orderStatusName;
    map["color_code"] = _colorCode;
    map["national_id_file"] = _nationalIdFile;
    map["email"] = _email;
    map["password"] = _password;
    map["nearest_landmark"] = _nearestLandmark;
    map["lat_long"] = _latLong;
    map["role"] = _role;
    map["is_active"] = _isActive;
    map["is_verify"] = _isVerify;
    map["token"] = _token;
    map["password_reset_code"] = _passwordResetCode;
    map["last_ip"] = _lastIp;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["otp"] = _otp;
    return map;
  }

}