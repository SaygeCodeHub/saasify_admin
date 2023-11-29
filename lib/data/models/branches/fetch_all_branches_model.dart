import 'dart:convert';

FetchAllBranchesModel fetchAllBranchesModelFromJson(String str) =>
    FetchAllBranchesModel.fromJson(json.decode(str));

String fetchAllBranchesModelToJson(FetchAllBranchesModel data) =>
    json.encode(data.toJson());

class FetchAllBranchesModel {
  final int status;
  final FetchBranchesData data;
  final String message;

  FetchAllBranchesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchAllBranchesModel.fromJson(Map<String, dynamic> json) =>
      FetchAllBranchesModel(
        status: json["status"],
        data: FetchBranchesData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class FetchBranchesData {
  final List<Branch> branches;

  FetchBranchesData({
    required this.branches,
  });

  factory FetchBranchesData.fromJson(Map<String, dynamic> json) =>
      FetchBranchesData(
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

class Branch {
  final int branchId;
  final String branchName;
  final int branchContact;
  final String branchAddress;

  Branch({
    required this.branchId,
    required this.branchName,
    required this.branchContact,
    required this.branchAddress,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        branchContact: json["branch_contact"],
        branchAddress: json["branch_address"],
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "branch_contact": branchContact,
        "branch_address": branchAddress,
      };
}
