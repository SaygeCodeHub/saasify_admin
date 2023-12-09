import 'dart:convert';

SaveBranchesModel saveBranchesModelFromJson(String str) =>
    SaveBranchesModel.fromJson(json.decode(str));

String saveBranchesModelToJson(SaveBranchesModel data) =>
    json.encode(data.toJson());

class SaveBranchesModel {
  final int status;
  final String message;
  final BranchesData data;

  SaveBranchesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SaveBranchesModel.fromJson(Map<String, dynamic> json) =>
      SaveBranchesModel(
        status: json["status"],
        message: json["message"],
        data: BranchesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class BranchesData {
  BranchesData();

  factory BranchesData.fromJson(Map<String, dynamic> json) => BranchesData();

  Map<String, dynamic> toJson() => {};
}
