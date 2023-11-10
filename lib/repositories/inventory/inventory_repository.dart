import '../../data/models/inventory/inventory_list_model.dart';

abstract class InventoryRepository {
  Future<InventoryListModel> fetchInventoryList(
      String userId, String companyId, int branchId);
}
