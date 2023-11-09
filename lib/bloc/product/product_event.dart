import 'package:saasify/data/models/products/product_list_model.dart';

abstract class ProductEvents {}

class FetchProductList extends ProductEvents {}

class SaveProduct extends ProductEvents {
  final Map productDetailsMap;

  SaveProduct({required this.productDetailsMap});
}

class DeleteProducts extends ProductEvents {
  final Map productDetailsMap;

  DeleteProducts({required this.productDetailsMap});
}

class ProductSelected extends ProductEvents {
  List<Product> productList;

  ProductSelected({required this.productList});
}
