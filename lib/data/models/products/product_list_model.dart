import 'dart:convert';

FetchProductListModel fetchProductListModelFromJson(String str) =>
    FetchProductListModel.fromJson(json.decode(str));

String fetchProductListModelToJson(FetchProductListModel data) =>
    json.encode(data.toJson());

class FetchProductListModel {
  final int status;
  final List<ProductWithVariant> data;
  final String message;

  FetchProductListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchProductListModel.fromJson(Map<String, dynamic> json) =>
      FetchProductListModel(
        status: json["status"],
        data: List<ProductWithVariant>.from(
            json["data"].map((x) => ProductWithVariant.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ProductWithVariant {
  final int categoryId;
  final String categoryName;
  final int productId;
  final String productName;
  final String brandName;
  final dynamic brandId;
  final int variantId;
  final int cost;
  final int quantity;
  final int discountPercent;
  final int stock;
  final String productDescription;
  final List<String> images;
  final String unit;
  final int barcode;
  final bool draft;
  final int restockReminder;

  ProductWithVariant({
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.brandName,
    required this.brandId,
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.discountPercent,
    required this.stock,
    required this.productDescription,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.draft,
    required this.restockReminder,
  });

  factory ProductWithVariant.fromJson(Map<String, dynamic> json) =>
      ProductWithVariant(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        brandId: json["brand_id"],
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"] ?? 0,
        stock: json["stock"],
        productDescription: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        draft: json["draft"],
        restockReminder: json["restock_reminder"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "product_id": productId,
        "product_name": productName,
        "brand_name": brandName,
        "brand_id": brandId,
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "discount_percent": discountPercent,
        "stock": stock,
        "product_description": productDescription,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "draft": draft,
        "restock_reminder": restockReminder,
      };
}
