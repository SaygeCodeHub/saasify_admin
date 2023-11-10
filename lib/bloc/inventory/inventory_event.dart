abstract class InventoryEvents {}

class FetchInventoryList extends InventoryEvents {}

class EditInventoryStock extends InventoryEvents {
  final Map editStockDetailsMap;

  EditInventoryStock({required this.editStockDetailsMap});
}
