import 'dart:convert';

InventoryListModel inventoryListModelFromJson(String str) =>
    InventoryListModel.fromJson(json.decode(str));

String inventoryListModelToJson(InventoryListModel data) =>
    json.encode(data.toJson());

class InventoryListModel {
  final int status;
  final List<InventoryProductList> data;
  final String message;

  InventoryListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory InventoryListModel.fromJson(Map<String, dynamic> json) =>
      InventoryListModel(
        status: json["status"],
        data: List<InventoryProductList>.from(
            json["data"].map((x) => InventoryProductList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class InventoryProductList {
  final int categoryId;
  final String categoryName;
  final int productId;
  final String productName;
  final String brandName;
  final int brandId;
  final int variantId;
  final int cost;
  final int quantity;
  final dynamic discountPercent;
  final int stock;
  final String productDescription;
  final List<String> image;
  final String unit;
  final int barcode;
  final bool draft;
  final int restockReminder;

  InventoryProductList({
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
    required this.image,
    required this.unit,
    required this.barcode,
    required this.draft,
    required this.restockReminder,
  });

  factory InventoryProductList.fromJson(Map<String, dynamic> json) =>
      InventoryProductList(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        brandId: json["brand_id"],
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"],
        stock: json["stock"],
        productDescription: json["product_description"],
        image: List<String>.from(json["image"].map((x) => x)),
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
        "image": List<dynamic>.from(image.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "draft": draft,
        "restock_reminder": restockReminder,
      };
}
