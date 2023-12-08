import 'dart:convert';

addPaymentMethodModelFromJson(String str) =>
    SavePaymentMethodModel.fromJson(json.decode(str));

String addPaymentMethodModelToJson(SavePaymentMethodModel data) =>
    json.encode(data.toJson());

class SavePaymentMethodModel {
  final int status;
  final Data data;
  final String message;

  SavePaymentMethodModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SavePaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      SavePaymentMethodModel(
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
