import 'dart:convert';

CouponsModel couponsModelFromJson(String str) =>
    CouponsModel.fromJson(json.decode(str));

String couponsModelToJson(CouponsModel data) => json.encode(data.toJson());

class CouponsModel {
  final int status;
  final String message;
  final List<Datum> data;

  CouponsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CouponsModel.fromJson(Map<String, dynamic> json) => CouponsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String couponName;
  final bool isActive;
  final String description;
  final int discountAmount;
  final int couponId;
  final String couponImage;

  Datum({
    required this.couponName,
    required this.isActive,
    required this.description,
    required this.discountAmount,
    required this.couponId,
    required this.couponImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        couponName: json["coupon_name"],
        isActive: json["isActive"],
        description: json["description"],
        discountAmount: json["discount_amount"],
        couponId: json["coupon_id"],
        couponImage: json["coupon_image"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_name": couponName,
        "isActive": isActive,
        "description": description,
        "discount_amount": discountAmount,
        "coupon_id": couponId,
        "coupon_image": couponImage,
      };
}
