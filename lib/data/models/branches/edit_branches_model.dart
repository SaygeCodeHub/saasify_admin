import 'dart:convert';

EditBranchesModel editBranchesModelFromJson(String str) =>
    EditBranchesModel.fromJson(json.decode(str));

String editBranchesModelToJson(EditBranchesModel data) =>
    json.encode(data.toJson());

class EditBranchesModel {
  final int status;
  final Data data;
  final String message;

  EditBranchesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EditBranchesModel.fromJson(Map<String, dynamic> json) =>
      EditBranchesModel(
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
