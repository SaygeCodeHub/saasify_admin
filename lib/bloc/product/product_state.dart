import '../../data/models/products/product_list_model.dart';

abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class FetchingProduct extends ProductStates {
  FetchingProduct();
}

class FetchedProduct extends ProductStates {
  ProductListModel productListModel;
  FetchedProduct({required this.productListModel});
}

class FetchProductError extends ProductStates {
  final String message;
  FetchProductError({required this.message});
}
