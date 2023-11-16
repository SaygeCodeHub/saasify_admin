import 'package:saasify/data/models/products/product_list_model.dart';

abstract class InventoryStates {}

class InventoryInitial extends InventoryStates {}

class FetchingInventoryList extends InventoryStates {}

class FetchedInventoryList extends InventoryStates {
  List<ProductWithVariant> productList;

  FetchedInventoryList({required this.productList});
}

class ErrorFetchingInventoryList extends InventoryStates {
  final String message;

  ErrorFetchingInventoryList({required this.message});
}

class UpdatingStock extends InventoryStates {}

class UpdatedStock extends InventoryStates {
  final String message;

  UpdatedStock({required this.message});
}

class ErrorUpdatingStock extends InventoryStates {
  final String message;

  ErrorUpdatingStock({required this.message});
}
