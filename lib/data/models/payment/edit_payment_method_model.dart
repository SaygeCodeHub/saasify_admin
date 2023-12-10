import 'dart:convert';

EditPaymentMethodModel editPaymentMethodModelFromJson(String str) =>
    EditPaymentMethodModel.fromJson(json.decode(str));

String editPaymentMethodModelToJson(EditPaymentMethodModel data) =>
    json.encode(data.toJson());

class EditPaymentMethodModel {
  final int status;
  final Data data;
  final String message;

  EditPaymentMethodModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EditPaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      EditPaymentMethodModel(
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
