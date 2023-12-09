import 'dart:convert';

FetchAllPaymentModel fetchAllPaymentModelFromJson(String str) =>
    FetchAllPaymentModel.fromJson(json.decode(str));

String fetchAllPaymentModelToJson(FetchAllPaymentModel data) =>
    json.encode(data.toJson());

class FetchAllPaymentModel {
  final int status;
  final List<PaymentData> data;
  final String message;

  FetchAllPaymentModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchAllPaymentModel.fromJson(Map<String, dynamic> json) =>
      FetchAllPaymentModel(
        status: json["status"],
        data: List<PaymentData>.from(
            json["data"].map((x) => PaymentData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class PaymentData {
  final int paymentId;
  final String paymentName;
  final bool isActive;

  PaymentData({
    required this.paymentId,
    required this.paymentName,
    required this.isActive,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        paymentId: json["payment_id"],
        paymentName: json["payment_name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "payment_id": paymentId,
        "payment_name": paymentName,
        "is_active": isActive,
      };
}
