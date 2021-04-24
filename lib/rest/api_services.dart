import 'dart:convert';
import 'dart:io';
import 'package:dawey/Models/OrderStatusLog.dart';
import 'package:dawey/Models/orderStatusResponse.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/myOrder.dart';
import 'package:dawey/Screens/CustomerController/ProfileController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:get/get.dart';
import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Models/aboutUsResponse.dart';
import 'package:dawey/Models/cityName.dart';
import 'package:dawey/Models/deliveryOrderListResponse.dart';
import 'package:dawey/Models/getProfile.dart';
import 'package:dawey/Models/langResponse.dart';
import 'package:dawey/Models/medicalPharmacyResponse.dart';
import 'package:dawey/Models/myTaskResponse.dart';
import 'package:dawey/Models/orderDetails.dart';
import 'package:dawey/Models/orderList.dart';
import 'package:dawey/Models/orderResponse.dart';
import 'package:dawey/Models/orderStatusUpdateResponse.dart';
import 'package:dawey/Models/order_details_all_response.dart';
import 'package:dawey/Models/pharmacyResponse.dart';
import 'package:dawey/Screens/CustomerController/LoginController/loginController.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'package:dawey/Models/loginResponse.dart';

//const String BASE_URL = "http://13.233.223.46/api/"; //old
const String BASE_URL = "https://dawaioman.com/api/"; //live

//Profile add verla city
//profile image upload
//my order check box with drop down

const String GMAILREGISTER = "register/gmail";
const String LOGIN = "login";
const String REGISTER = "register";
const String LANGUAGE = "language";
const String PROFILE = "profile";
const String CITY = "city";
const String MYORDER = "myorder";
const String ORDER_LIST = "orderlist";
const String ORDER_DETAILS = "orderdet";
const String CMS = "cms";
const String SEARCH = "/search";
const String PHARMACY = "pharmacy";
const String GETPROFILE = "profile/getProfile";
const String UPDATEPROFILE = "profile/updateprofile";
const String DELBOY_TASK = "delboy/tasks";
const String DELBOY_TASK_LIST = "delboy/tasksList";
const String DELIVERY_ORDERLIST_SEARCH = "delboy/search";
const String ORDER_STATUS_UPDATE = "delboy/orderStatus";
const String ORDER_STATUS = "orderlist/orderStatusList";
const String SEND_FEEDBACK = "profile/insertFeedback";
const String ORDER_DELIVERY_DATE = "orderdet/orderDeliveryDate";
const String UPDATENATION_ID = "profile/updateNationalId";
const String UPLOAD_PROFILE = "profile/updateProfileImage";
const String ORDER_STATUS_LOG = "orderdet/orderStatusLog?order_id=";
ProfileController profileController = ProfileController();

/*Future<LoginResponse> loginApi(param, lat_long) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + LOGIN,
      body: {
        "mobile_no": "$param",
        "lat_long": "$lat_long",
      },
    );
    print("Login url  ${response.request.url}");
    print("Login response  ${response.body}");
    print('Login Statuscode : ${response.statusCode}');
    if (response.statusCode == 200) {
      return LoginResponse.fromMap(json.decode(response.body));
    }
    // if (response.statusCode == 403) {
    //   mySnackbar(title: '${getLabel("error")}', description: 'Invalid Login');
    //   Get.find<LoginController>().isLoading.value = false;
    //   Get.find<LoginController>().mobileController.clear();
    // }
    else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}*/

Future<http.Response> loginApi(param, lat_long) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + LOGIN,
      body: {
        "mobile_no": "$param",
        "lat_long": "$lat_long",
      },
    );
    print("login response is ${response.body}");
    return response;
  } finally {
    client.close();
  }
}

Future<http.Response> orderDeliveryDate(order_id, order_status_id) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL +
          ORDER_DELIVERY_DATE +
          "?order_id=" +
          order_id +
          "&order_status_id=" +
          order_status_id,
    );
    print("delivery order date  url  ${response.request.url}");
    print("delivery order date  response is ${response.body}");
    return response;
  } finally {
    client.close();
  }
}

Future<http.Response> sendFeedback(customerId, feedback) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + SEND_FEEDBACK,
      body: {
        "customer_id": "$customerId",
        "feedback": "$feedback",
      },
    );
    print("send url  is ${response.request.url}");
    print("send Feedback response is ${response.body}");
    return response;
  } finally {
    client.close();
  }
}

Future<http.Response> gmailLoginApi(param, lat_long) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + GMAILREGISTER,
      body: {
        "email_id": "$param",
        "lat_long": "$lat_long",
      },
    );
    print("GMAIL response is ${response.request.url}");

    print("GMAIL response is ${response.body}");
    return response;
  } finally {
    client.close();
  }
}

Future<LangData> getLabelApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + LANGUAGE + "?code=" + param,
    );
    print("Langauge url  ${response.request.url}");
    print("Langauge response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return LangData.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<OrderStatusLog> getOrderStatusLogApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + ORDER_STATUS_LOG + param,
    );
    print("Login url  ${response.request.url}");
    print("Login response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      var data = orderStatusLogFromMap(decode);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<http.Response> registerApi(param, lat_long) async {
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + REGISTER,
      body: {
        "mobile_no": "$param",
        "lat_long": "$lat_long",
      },
    );
    print("register url ${data.request.url}");
    print("register param is ${param}  ${lat_long}");
    print("register response is ${data.body}");
    return data;
  } finally {
    client.close();
  }
}

Future<http.Response> profileApi(
    String nationalId,
    String MRN,
    String firstName,
    String lastName,
    String address,
    String streetName,
    String wayNumber,
    String houseBuilding,
    String apprtment,
    String city,
    String governot,
    String mobileNo,
    String email_id,
    String nearest) async {
  var client = new http.Client();
  print("nationalId: $nationalId");
  print("MRN : $MRN");
  print("firstName : $firstName");
  print("lastName : $lastName");
  print("address : $address");
  print("streetName : $streetName");
  print("wayNumber : $wayNumber");
  print("houseBuilding : $houseBuilding");
  print("apprtment : $apprtment");
  print("city : $city");
  print("governot : $governot");
  print("mobileNo : $mobileNo");
  print("email_id : $email_id");
  print("nearest : $nearest");
  try {
    http.Response data = await client.post(
      BASE_URL + PROFILE,
      body: {
        "national_id": "$nationalId",
        "mrn_no": "$MRN",
        "firstname": "$firstName",
        "lastname": "$lastName",
        "address": "$address",
        "street_name": "$streetName",
        "way_number": "$wayNumber",
        "house_building": "$houseBuilding",
        "appartment_number": "$apprtment",
        "city": "$city",
        "governorate": "$governot",
        "mobile_no": "$mobileNo",
        "email_id": "$email_id",
        "nearest_landmark": "$nearest",
      },
    );
    print("profile api  ${data.request.url}");
    print("profile response ${data.body}");
    return data;
  } finally {
    client.close();
  }
}

Future<http.Response> updateProfileApi(
    {String nationalId,
    // ignore: non_constant_identifier_names
    String MRN,
    String firstName,
    String lastName,
    String address,
    String streetName,
    String wayNumber,
    String houseBuilding,
    String apprtment,
    String city,
    String governot,
    String mobileNo,
    String email_id,
    String nearest,
    String cid}) async {

  print("MRN $MRN");
  print("firstName $firstName");
  print("lastName $lastName");
  print("address $address");
  print("streetName $streetName");
  print("wayNumber $wayNumber");
  print("houseBuilding $houseBuilding");
  print("apprtment $apprtment");
  print("city $city");
  print("governot $governot");
  print("mobileNo $mobileNo");
  print("email_id $email_id");
  print("nearest $nearest");
  print("cid $cid");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + UPDATEPROFILE,
      body: {
        "national_id": "$nationalId",
        "mrn_no": "$MRN",
        "firstname": "$firstName",
        "lastname": "$lastName",
        "address": "$address",
        "street_name": "$streetName",
        "way_number": "$wayNumber",
        "house_building": "$houseBuilding",
        "appartment_number": "$apprtment",
        "city": "$city",
        "governorate": "$governot",
        "mobile_no": "$mobileNo",
        "email_id": "$email_id",
        "nearest_landmark": "$nearest",
        "customer_id": "$cid"
      },
    );

    print("update url is ${data.request.url}");
    print("profile response ${data.body}");
    return data;
  } finally {
    client.close();
  }
}

saveProfileWithFileApi(param, callBack) async {
  // var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
  // get file length
//  var length = await file.length(); //imageFile is your image file

  var uri = Uri.parse(BASE_URL + PROFILE);

  final imageUploadRequest = http.MultipartRequest('POST', uri);

  imageUploadRequest.fields.addAll(param);

  final streamedResponse = await imageUploadRequest.send();
  final response = await http.Response.fromStream(streamedResponse);

  print("profile with image ${response.body}");
  var responseData = json.decode(response.body);
  if (responseData['success'] == "true") {
    Get.to(MyOrder(0, "home"));

    mySnackbar(
        title: '${getLabel("success")}', description: responseData['result']);
  } else {
    mySnackbar(
        title: '${getLabel("error")}', description: responseData['result']);
  }
  print(response.statusCode);
/*  response.stream.transform(utf8.decoder).listen((value) {
    callBack(value);
  });*/
}

/*saveProfileWithFileApi(file, param, callBack,  param3,) async {
  print("nation id image :$file");
  print("profile save image  :$param3");

 // var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
  // get file length
//  var length = await file.length(); //imageFile is your image file

  var uri = Uri.parse(BASE_URL + PROFILE);
*/ /*  var request = new http.MultipartRequest("POST", uri);
*/ /**/ /*  var multipartFileSign = new http.MultipartFile(
      'national_id_file', stream, length,
      filename: basename(file.path));*/ /**/ /*

  var multipartFileSign2 = new http.MultipartFile(
      'profile_image', stream, length,
      filename: basename(param3.path));
  //request.files.add(multipartFileSign);
  request.files.add(multipartFileSign2);
  request.fields.addAll(param);
  var response = await request.send();*/ /*

  final imageUploadRequest = http.MultipartRequest('POST', uri);
  final mimeTypeData =
  lookupMimeType(param3.path, headerBytes: [0xFF, 0xD8]).split('/');
  final file1 = await http.MultipartFile.fromPath('profile_image', param3.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
  imageUploadRequest.fields.addAll(param);
  imageUploadRequest.files.add(file1);
  final streamedResponse = await imageUploadRequest.send();
  final response = await http.Response.fromStream(streamedResponse);



  print("profile with image ${response.body}");
  print(response.statusCode);
 */ /* response.stream.transform(utf8.decoder).listen((value) {
    callBack(value);
  });*/ /*
}*/

updateProfileWithFileApi(param, callBack) async {
  print("udpate profile param...${param}");
  var uri = Uri.parse(BASE_URL + PROFILE);

  final imageUploadRequest = http.MultipartRequest('POST', uri);

  imageUploadRequest.fields.addAll(param);

  final streamedResponse = await imageUploadRequest.send();
  final response = await http.Response.fromStream(streamedResponse);

  print("update profile  with image ${response.body}");
  var responseData = json.decode(response.body);
  if (responseData['success'] == "true") {
    Get.to(Home(0));

    mySnackbar(
        title: '${getLabel("success")}', description: responseData['result']);
  } else {
    mySnackbar(
        title: '${getLabel("error")}', description: responseData['result']);
  }
  print(response.statusCode);
}

updateNationalId(file, param, callBack) async {
  var uri = Uri.parse(BASE_URL + UPDATENATION_ID);

  final imageUploadRequest = http.MultipartRequest('POST', uri);
  if (file != null) {
    final mimeTypeData =
        lookupMimeType(file.path, headerBytes: [0xFF, 0xD8]).split('/');
    final file1 = await http.MultipartFile.fromPath(
        'national_id_file', file.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUploadRequest.files.add(file1);
  }

  imageUploadRequest.fields.addAll(param);

  final streamedResponse = await imageUploadRequest.send();
  final response = await http.Response.fromStream(streamedResponse);

  print("nationid image response ${response.body}");
  var responseData = json.decode(response.body);
  print(response.statusCode);
}

updatePROFILEIMAGE(file, param, callBack) async {
  var uri = Uri.parse(BASE_URL + UPLOAD_PROFILE);

  final imageUploadRequest = http.MultipartRequest('POST', uri);
  if (file != null) {
    final mimeTypeData =
        lookupMimeType(file.path, headerBytes: [0xFF, 0xD8]).split('/');
    final file1 = await http.MultipartFile.fromPath('profile_image', file.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUploadRequest.files.add(file1);
  }

  imageUploadRequest.fields.addAll(param);

  final streamedResponse = await imageUploadRequest.send();
  final response = await http.Response.fromStream(streamedResponse);

  print("nationid image response ${response.body}");
  var responseData = json.decode(response.body);
  print(response.statusCode);
}

Future<CityResponse> getCityApi() async {
  var client = new http.Client();
  try {
    http.Response response = await client.get(
      BASE_URL + CITY,
    );
    print("City response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return CityResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<OrderResponse> getOrderlApi(
  String customerID,
  String pharmacyID,
  String pharamacyName,
  String mobileNO,
  String nationalId,
  String MRNNo,
  String firstName,
  String lastName,
  String address,
  String streetName,
  String wayNumber,
  String houdBuilding,
  String apprtMent,
  String city,
  String governorate,
  String clintNote,
) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(BASE_URL + MYORDER, body: {
      "customer_id": "$customerID",
      "pharmacy_id": pharmacyID,
      "pharmacy_name": "$pharamacyName",
      "mobile_no": "$mobileNO",
      "national_id": "$nationalId",
      "mrn_no": "$MRNNo",
      "firstname": "$firstName",
      "lastname": "$lastName",
      "address": "$address",
      "street_name": "$streetName",
      "way_number": "$wayNumber",
      "house_building": "$houdBuilding",
      "appartment_number": "$apprtMent",
      "city": "$city",
      "governorate": "$governorate",
      "client_note": "$clintNote",
    });
    print("order url  ${response.request.url}");
    print("order url pharmacy name ${pharamacyName}");
    print("order response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return OrderResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<OrderListResponse> getOrderListApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + ORDER_LIST + "?customer_id=" + param,
    );
    print("Order url  ${response.request.url}");
    print("Order response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return OrderListResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<http.Response> getOrderDetailstApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + ORDER_DETAILS + "?invoice_no=" + param,
    );
    print("Order Detail ${response.request.url}");
    print("Order Detail ${response.body}");
    return response;
  } finally {
    client.close();
  }
}
/*Future<OrderDetailsAllResponse> getOrderDetailstApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + ORDER_DETAILS + "?invoice_no=" + param,
    );
    print("Order details url  ${response.request.url}");
    print("Order details response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return OrderDetailsAllResponse.fromJson(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}*/

Future<AboutUsResponseResponse> getAboutUstApi(String lngID, String cms) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + CMS + "?language_id=" + lngID + "&cms_id=" + cms,
    );
    print("about us url  ${response.request.url}");
    print("about us response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return AboutUsResponseResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<OrderListResponse> dashBoardSearchApi(
    cId, month, search, order_status) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(BASE_URL +
        ORDER_LIST +
        SEARCH +
        "?customer_id=" +
        '$cId' +
        "&month=" +
        '$month' +
        "&search=" +
        search +
        "&order_status_id=" +
        order_status);
    print("Order url  ${response.request.url}");
    print("Order response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);

      return OrderListResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}
/*
Future<http.Response> getPharmacyApi() async {
  var client = new http.Client();
  try {
    http.Response data = await client.get(
      BASE_URL + PHARMACY,
    );
    print("pharmacy response is ${data.body}");
    return data;
  } finally {
    client.close();
  }
}*/

Future<PharmacyResponse> getPharmacyApi() async {
  var client = new http.Client();
  try {
    http.Response response = await client.get(
      BASE_URL + PHARMACY,
    );
    print("pharmacy response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return PharmacyResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<OrderStatusResponse> getOrderListStatusApi() async {
  var client = new http.Client();
  try {
    http.Response response = await client.get(
      BASE_URL + ORDER_STATUS,
    );
    print("pharmacy response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return OrderStatusResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<GetProfileResponse> getProfiletApi(param) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + GETPROFILE + "?customer_id=" + param,
    );
    print("getProfile url  ${response.request.url}");
    print("getProfile response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return GetProfileResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<TaskResponse> getMyTaskApi(
    String dboyId, String pharmcayId, String date, String orderStatus) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL +
          DELBOY_TASK +
          "?dboy_id=" +
          dboyId +
          "&pharmacy_id=" +
          pharmcayId +
          "&date=" +
          date +
          "&order_status_id=" +
          orderStatus,
    );
    print("my task url  ${response.request.url}");
    print("my task response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return TaskResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<MedicalPharmacyResponse> getMyDelBoyTaskListApi(
    String dboyId, String pharmcayId, String flag) async {
  var client = new http.Client();
  try {
    http.Response response = await client.get(BASE_URL +
        DELBOY_TASK_LIST +
        "?dboy_id=" +
        dboyId +
        "&pharmacy_id=" +
        pharmcayId +
        "&task_status=" +
        flag);
    print("del my task url  ${response.request.url}");
    print("del my task response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return MedicalPharmacyResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}

Future<DeliveryOrderListResponse> getDeliveryOrderListApi(
  String customer_id,
  String month,
  String search,
  String order_status,
) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL +
          DELIVERY_ORDERLIST_SEARCH +
          "?deliverboy_id=" +
          customer_id +
          "&month=" +
          '$month' +
          "&search=" +
          '$search' +
          "&order_status_id=" +
          order_status,
    );
    print("delivery order list url  ${response.request.url}");
    print("delivery order list  response  ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return DeliveryOrderListResponse.fromMap(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}
/*Future<OrderStatusUpdateResponse> updateOrderStatusApi(orderId, String orderStatus, String not_del_content) async {
  var client = new http.Client();
  try {
    http.Response response = await client.post(
      BASE_URL + ORDER_STATUS_UPDATE + '?order_id=$orderId' + '&order_status_id=$orderStatus'+ '&not_del_content=$not_del_content' ,
    );
    print("Order Status  ${response.request.url}");
    print("Order Status ${response.body}");
    if (response.statusCode == 200) {
      String decode = utf8.decode(response.bodyBytes);
      return OrderStatusUpdateResponse.fromJson(json.decode(decode));
    } else {
      throw Exception('Failed to load post');
    }
  } finally {
    client.close();
  }
}*/

Future<http.Response> updateOrderStatusApi(
    orderId, String orderStatus, String not_del_content) async {
  var client = new http.Client();
  print("orderId is ${orderId}");
  print("orderStatus is ${orderStatus}");
  print("ornot_del_contentderId is ${not_del_content}");
  try {
    http.Response response = await client.post(
      BASE_URL +
          ORDER_STATUS_UPDATE +
          '?order_id=$orderId' +
          '&order_status_id=$orderStatus' +
          '&not_del_content=$not_del_content',
    );
    print("order update status response is ${response.body}");
    return response;
  } finally {
    client.close();
  }
}
