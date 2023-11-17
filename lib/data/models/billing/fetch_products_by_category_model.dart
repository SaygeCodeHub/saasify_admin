import 'dart:convert';

FetchProductsByCategoryPosModel fetchProductsByCategoryPosModelFromJson(
        String str) =>
    FetchProductsByCategoryPosModel.fromJson(json.decode(str));

String fetchProductsByCategoryPosModelToJson(
        FetchProductsByCategoryPosModel data) =>
    json.encode(data.toJson());

class FetchProductsByCategoryPosModel {
  final int status;
  final List<CategoryWithProductsDatum> data;
  final String message;

  FetchProductsByCategoryPosModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchProductsByCategoryPosModel.fromJson(Map<String, dynamic> json) =>
      FetchProductsByCategoryPosModel(
        status: json["status"],
        data: List<CategoryWithProductsDatum>.from(
            json["data"].map((x) => CategoryWithProductsDatum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class CategoryWithProductsDatum {
  final int categoryId;
  final String categoryName;
  final List<Product> products;

  CategoryWithProductsDatum({
    required this.categoryId,
    required this.categoryName,
    required this.products,
  });

  factory CategoryWithProductsDatum.fromJson(Map<String, dynamic> json) =>
      CategoryWithProductsDatum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int productId;
  final String productName;
  final String brandName;
  final String productDescription;
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.brandName,
    required this.productDescription,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        productDescription: json["product_description"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "brand_name": brandName,
        "product_description": productDescription,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Variant {
  final int variantId;
  final int cost;
  final int quantity;
  final int discountPercent;
  final int stockId;
  final int stock;
  final List<String> images;
  final String unit;
  final int barcode;
  final int restockReminder;
  final bool draft;

  Variant({
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.discountPercent,
    required this.stockId,
    required this.stock,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.restockReminder,
    required this.draft,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"],
        stockId: json["stock_id"],
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        restockReminder: json["restock_reminder"],
        draft: json["draft"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "discount_percent": discountPercent,
        "stock_id": stockId,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "restock_reminder": restockReminder,
        "draft": draft,
      };
}
