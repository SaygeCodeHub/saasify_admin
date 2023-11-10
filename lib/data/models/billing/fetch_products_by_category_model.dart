import 'package:hive_flutter/adapters.dart';
import 'dart:convert';

part 'fetch_products_by_category_model.g.dart';

FetchProductsByCategoryModel fetchProductsByCategoryModelFromJson(String str) =>
    FetchProductsByCategoryModel.fromJson(json.decode(str));

String fetchProductsByCategoryModelToJson(FetchProductsByCategoryModel data) =>
    json.encode(data.toJson());

class FetchProductsByCategoryModel {
  final int status;
  final String message;
  final List<CategoryWithProductsDatum> data;

  FetchProductsByCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchProductsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      FetchProductsByCategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<CategoryWithProductsDatum>.from(
            json["data"].map((x) => CategoryWithProductsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 4)
class CategoryWithProductsDatum {
  @HiveField(0)
  final int categoryId;
  @HiveField(1)
  final String categoryName;
  @HiveField(2)
  final String categoryImage;
  @HiveField(3)
  final List<Product> products;

  CategoryWithProductsDatum({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.products,
  });

  factory CategoryWithProductsDatum.fromJson(Map<String, dynamic> json) =>
      CategoryWithProductsDatum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String details;
  @HiveField(3)
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.details,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        details: json["details"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "details": details,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class Variant {
  @HiveField(0)
  final int variantId;
  @HiveField(1)
  final double variantCost;
  @HiveField(2)
  final int count;
  @HiveField(3)
  final String brandName;
  @HiveField(4)
  final double discountedCost;
  @HiveField(5)
  final int discount;
  @HiveField(6)
  final String quantity;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final List<String> image;
  @HiveField(9)
  final int ratings;

  Variant({
    required this.variantId,
    required this.variantCost,
    required this.count,
    required this.brandName,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.image,
    required this.ratings,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        variantCost: json["variant_cost"].toDouble(),
        count: json["count"],
        brandName: json["brand_name"],
        discountedCost: json["discounted_cost"].toDouble(),
        discount: json["discount"],
        quantity: json["quantity"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        ratings: json["ratings"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "variant_cost": variantCost,
        "count": count,
        "brand_name": brandName,
        "discounted_cost": discountedCost,
        "discount": discount,
        "quantity": quantity,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "ratings": ratings,
      };
}
