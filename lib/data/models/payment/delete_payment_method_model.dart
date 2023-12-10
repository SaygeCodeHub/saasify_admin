import 'dart:convert';

DeletePaymentMethodModel deletePaymentMethodModelFromJson(String str) =>
    DeletePaymentMethodModel.fromJson(json.decode(str));

String deletePaymentMethodModelToJson(DeletePaymentMethodModel data) =>
    json.encode(data.toJson());

class DeletePaymentMethodModel {
  final int status;
  final Data data;
  final String message;

  DeletePaymentMethodModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeletePaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      DeletePaymentMethodModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
