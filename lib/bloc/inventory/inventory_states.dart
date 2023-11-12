abstract class InventoryStates {}

class InventoryInitial extends InventoryStates {}

class FetchingInventoryList extends InventoryStates {}

class FetchedInventoryList extends InventoryStates {
  FetchedInventoryList();
}

class FetchInventoryListError extends InventoryStates {
  final String message;

  FetchInventoryListError({required this.message});
}
