import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  final int status;
  final String message;
  final List<Product> data;

  ProductListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        status: json["status"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  final int categoryId;
  final String categoryName;
  final int productId;
  final String productName;
  final String brandName;
  final int variantId;
  final int variantCost;
  final int quantity;
  final dynamic discountedCost;
  final dynamic discount;
  final int stock;
  final String description;
  final List<String> image;
  final int ratings;
  final String measuringUnit;
  final int barcodeNo;

  Product({
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.brandName,
    required this.variantId,
    required this.variantCost,
    required this.quantity,
    required this.discountedCost,
    required this.discount,
    required this.stock,
    required this.description,
    required this.image,
    required this.ratings,
    required this.measuringUnit,
    required this.barcodeNo,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        variantId: json["variant_id"],
        variantCost: json["variant_cost"],
        quantity: json["quantity"],
        discountedCost: json["discounted_cost"],
        discount: json["discount"],
        stock: json["stock"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        ratings: json["ratings"],
        measuringUnit: json["measuring_unit"],
        barcodeNo: json["barcode_no"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "product_id": productId,
        "product_name": productName,
        "brand_name": brandName,
        "variant_id": variantId,
        "variant_cost": variantCost,
        "quantity": quantity,
        "discounted_cost": discountedCost,
        "discount": discount,
        "stock": stock,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "ratings": ratings,
        "measuring_unit": measuringUnit,
        "barcode_no": barcodeNo,
      };
}
