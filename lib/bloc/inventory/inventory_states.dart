import '../../data/models/inventory/inventory_list_model.dart';

abstract class InventoryStates {}

class InventoryInitial extends InventoryStates {}

class FetchingInventoryProductList extends InventoryStates {}

class FetchedInventoryProductList extends InventoryStates {
  List<InventoryProductList> inventoryProductList;

  FetchedInventoryProductList({required this.inventoryProductList});
}

class FetchInventoryProductListError extends InventoryStates {
  final String message;

  FetchInventoryProductListError({required this.message});
}

class EditingInventoryStock extends InventoryStates {}

class EditedInventoryStock extends InventoryStates {
  final String message;

  EditedInventoryStock({required this.message});
}

class ErrorEditingInventoryStock extends InventoryStates {
  final String message;

  ErrorEditingInventoryStock({required this.message});
}
