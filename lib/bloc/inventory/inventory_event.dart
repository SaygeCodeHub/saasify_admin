abstract class InventoryEvents {}

class FetchInventoryList extends InventoryEvents {}

class UpdateStock extends InventoryEvents {
  final Map updateStockMap;

  UpdateStock({required this.updateStockMap});
}
