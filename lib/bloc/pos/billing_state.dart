import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';

import '../../data/models/billing/selected_product_model.dart';
import '../../data/models/billing/bill_model.dart';

abstract class BillingStates {}

class BillingInitial extends BillingStates {}

class FetchingProductsByCategory extends BillingStates {}

class ErrorFetchingProductsByCategory extends BillingStates {
  final String message;

  ErrorFetchingProductsByCategory({required this.message});
}

class ProductsLoaded extends BillingStates {
  final List<CategoryWithProductsDatum> productsByCategories;
  final int selectedCategoryIndex;
  final List<SelectedProductModel> selectedProducts;
  final BillModel billDetails;

  ProductsLoaded(
      {required this.billDetails,
      required this.selectedProducts,
      required this.selectedCategoryIndex,
      required this.productsByCategories});
}

class LoadDataBaseOrders extends BillingStates {
  List<dynamic> customerIdList;

  LoadDataBaseOrders({required this.customerIdList});
}

class SettlingOrder extends BillingStates {}

class OrderSettled extends BillingStates {}

class ErrorSettlingOrder extends BillingStates {
  final String message;

  ErrorSettlingOrder({required this.message});
}
