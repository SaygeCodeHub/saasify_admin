import 'package:saasify/data/models/inventory/inventory_list_model.dart';

import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  @override
  Future<InventoryListModel> fetchInventoryList(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllProducts');
    return InventoryListModel.fromJson(response);
  }
}
