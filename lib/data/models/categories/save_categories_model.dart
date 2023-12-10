import 'dart:convert';

SaveCategoriesModel saveCategoriesModelFromJson(String str) =>
    SaveCategoriesModel.fromJson(json.decode(str));

String saveCategoriesModelToJson(SaveCategoriesModel data) =>
    json.encode(data.toJson());

class SaveCategoriesModel {
  final int status;
  final Data data;
  final String message;

  SaveCategoriesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SaveCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SaveCategoriesModel(
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
