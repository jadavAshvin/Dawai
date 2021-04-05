class OrderStatusUpdateResponse {
  String success;
  String msg;
  OrderStatusUpdateResponse({
    this.success,
    this.msg
  });
  factory OrderStatusUpdateResponse.fromJson(Map<String, dynamic> json) => OrderStatusUpdateResponse(
        success: json["success"],
        msg: json["message"],
    );
}
