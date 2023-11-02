import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final int status;
  final String message;
  final LoginData data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class LoginData {
  final String companyId;
  final dynamic companyContact;
  final String companyEmail;
  final String companyName;
  final int roleId;
  final List<Branch> branches;

  LoginData({
    required this.companyId,
    required this.companyContact,
    required this.companyEmail,
    required this.companyName,
    required this.roleId,
    required this.branches,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        companyId: json["companyId"] ?? '',
        companyContact: json["company_contact"] ?? '',
        companyEmail: json["company_email"] ?? '',
        companyName: json["company_name"] ?? '',
        roleId: json["role_id"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "company_contact": companyContact,
        "company_email": companyEmail,
        "company_name": companyName,
        "role_id": roleId,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

class Branch {
  final int branchId;
  final String branchEmail;
  final String branchName;
  final int branchNumber;
  final String branchAddress;

  Branch({
    required this.branchId,
    required this.branchEmail,
    required this.branchName,
    required this.branchNumber,
    required this.branchAddress,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branchEmail: json["branch_email"] ?? '',
        branchName: json["branch_name"] ?? '',
        branchNumber: json["branch_number"],
        branchAddress: json["branch_address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_email": branchEmail,
        "branch_name": branchName,
        "branch_number": branchNumber,
        "branch_address": branchAddress,
      };
}
