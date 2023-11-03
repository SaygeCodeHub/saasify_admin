import 'dart:convert';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  final int status;
  final String message;
  final Data data;

  AuthenticationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final String userName;
  final String userId;
  final int userContact;
  final List<Company> companies;

  Data({
    required this.userName,
    required this.userId,
    required this.userContact,
    required this.companies,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["user_name"],
        userId: json["user_id"],
        userContact: json["user_contact"],
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "user_id": userId,
        "user_contact": userContact,
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Company {
  final String companyId;
  final String companyDomain;
  final String companyEmail;
  final String companyName;
  final String services;
  final String companyLogo;
  final int companyContact;
  final String companyAddress;
  final DateTime onboardingDate;

  Company({
    required this.companyId,
    required this.companyDomain,
    required this.companyEmail,
    required this.companyName,
    required this.services,
    required this.companyLogo,
    required this.companyContact,
    required this.companyAddress,
    required this.onboardingDate,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json["company_id"],
        companyDomain: json["company_domain"],
        companyEmail: json["company_email"],
        companyName: json["company_name"],
        services: json["services"],
        companyLogo: json["company_logo"],
        companyContact: json["company_contact"],
        companyAddress: json["company_address"],
        onboardingDate: DateTime.parse(json["onboarding_date"]),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_domain": companyDomain,
        "company_email": companyEmail,
        "company_name": companyName,
        "services": services,
        "company_logo": companyLogo,
        "company_contact": companyContact,
        "company_address": companyAddress,
        "onboarding_date": onboardingDate.toIso8601String(),
      };
}
