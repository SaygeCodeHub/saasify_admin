abstract class InventoryEvents {}

class FetchInventoryList extends InventoryEvents {}

class UpdateStock extends InventoryEvents {
  final Map productDetailsMap;

  UpdateStock({required this.productDetailsMap});
}
