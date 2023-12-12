import 'package:hive_flutter/adapters.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';

part 'selected_product_model.g.dart';

@HiveType(typeId: 0)
class SelectedProductModel {
  @HiveField(0)
  int count;
  @HiveField(1)
  final Product product;

  SelectedProductModel({required this.count, required this.product});

  factory SelectedProductModel.fromJson(Map<String, dynamic> json) =>
      SelectedProductModel(
          count: json["count"], product: Product.fromJson(json["product"]));

  Map<String, dynamic> toJson() =>
      {"count": count, "product": product.toJson()};
}
