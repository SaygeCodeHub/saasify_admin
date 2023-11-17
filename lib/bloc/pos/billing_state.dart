import '../../data/models/billing/fetch_products_by_category_model.dart';

abstract class BillingStates {}

class BillingInitial extends BillingStates {}

class FetchingProductsByCategory extends BillingStates {}

class ProductsFetched extends BillingStates {
  final List<CategoryWithProductsDatum> productsByCategories;
  final int selectedCategoryIndex;

  ProductsFetched(
      {required this.selectedCategoryIndex,
      required this.productsByCategories});
}

class ErrorFetchingProductsByCategory extends BillingStates {
  final String message;

  ErrorFetchingProductsByCategory({required this.message});
}
