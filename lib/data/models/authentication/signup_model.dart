import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final int status;
  final String message;
  final SignUpData data;

  SignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        message: json["message"],
        data: SignUpData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class SignUpData {
  final String companyId;
  final String companyContact;
  final String companyEmail;
  final String companyName;
  final int roleId;
  final List<dynamic> branches;

  SignUpData({
    required this.companyId,
    required this.companyContact,
    required this.companyEmail,
    required this.companyName,
    required this.roleId,
    required this.branches,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
        companyId: json["companyId"] ?? '',
        companyContact: json["company_contact"] ?? '',
        companyEmail: json["company_email"] ?? '',
        companyName: json["company_name"] ?? '',
        roleId: json["role_id"],
        branches: List<dynamic>.from(json["branches"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "company_contact": companyContact,
        "company_email": companyEmail,
        "company_name": companyName,
        "role_id": roleId,
        "branches": List<dynamic>.from(branches.map((x) => x)),
      };
}
