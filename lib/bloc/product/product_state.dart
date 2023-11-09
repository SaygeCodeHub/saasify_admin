import '../../data/models/products/product_list_model.dart';

abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class FetchingProduct extends ProductStates {}

class FetchedProduct extends ProductStates {
  List<Product> productList;

  FetchedProduct({required this.productList});
}

class FetchProductError extends ProductStates {
  final String message;

  FetchProductError({required this.message});
}

class SavingProduct extends ProductStates {}

class SavedProduct extends ProductStates {}

class ErrorSavingProduct extends ProductStates {
  final String message;

  ErrorSavingProduct({required this.message});
}

class DeletingProducts extends ProductStates {}

class DeletedProducts extends ProductStates {}

class ErrorDeletingProducts extends ProductStates {
  final String message;

  ErrorDeletingProducts({required this.message});
}
