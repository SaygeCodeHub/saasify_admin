import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';

import '../../data/models/billing/selected_product_model.dart';
import '../../data/models/billing/bill_model.dart';

abstract class BillingStates {}

class BillingInitial extends BillingStates {}

class FetchingProductsByCategory extends BillingStates {}

class ErrorFetchingProductsByCategory extends BillingStates {}

class ProductsFetched extends BillingStates {
  final List<CategoryWithProductsDatum> productsByCategories;
  final int selectedCategoryIndex;
  final List<SelectedProductModel> selectedProducts;
  final BillModel billDetails;

  ProductsFetched(
      {required this.billDetails,
      required this.selectedProducts,
      required this.selectedCategoryIndex,
      required this.productsByCategories});
}

class LoadDataBaseOrders extends BillingStates {
  List<dynamic> customerIdList;

  LoadDataBaseOrders({required this.customerIdList});
}
