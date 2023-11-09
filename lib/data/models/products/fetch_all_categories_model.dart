import 'dart:convert';

FetchAllCategoriesModel fetchAllCategoriesFromJson(String str) =>
    FetchAllCategoriesModel.fromJson(json.decode(str));

String fetchAllCategoriesToJson(FetchAllCategoriesModel data) =>
    json.encode(data.toJson());

class FetchAllCategoriesModel {
  final int status;
  final String message;
  final List<ProductCategory> data;

  FetchAllCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchAllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      FetchAllCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: List<ProductCategory>.from(
            json["data"].map((x) => ProductCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductCategory {
  final int categoryId;
  final String categoryName;

  ProductCategory({
    required this.categoryId,
    required this.categoryName,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
      };
}
