import '../../data/models/orders/fetch_orders_model.dart';

abstract class OrdersRepository {
  Future<FetchOrdersModel> fetchOrdersList(
      String userId, String companyId, int branchId);
}
