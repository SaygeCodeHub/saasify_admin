import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';

import '../../data/models/billing/selected_product_model.dart';

abstract class BillingEvents {}

class FetchProductsByCategory extends BillingEvents {}

class LoadAllOrders extends BillingEvents {}

class BillingInitialEvent extends BillingEvents {
  int orderIndex;

  BillingInitialEvent({required this.orderIndex});
}

class FetchCoupons extends BillingEvents {}

class SelectCategory extends BillingEvents {
  final List<CategoryWithProductsDatum> productsByCategories;

  SelectCategory({required this.productsByCategories});
}

class SelectProduct extends BillingEvents {
  final Product product;
  final List<CategoryWithProductsDatum> productsByCategories;
  final int variantIndex;

  SelectProduct(
      {required this.variantIndex,
      required this.productsByCategories,
      required this.product});
}

class ExpandBilling extends BillingEvents {
  final List<CategoryWithProductsDatum> productsByCategories;

  ExpandBilling({required this.productsByCategories});
}

class RemoveProduct extends BillingEvents {
  final Product product;
  final List<CategoryWithProductsDatum> productsByCategories;

  RemoveProduct({required this.productsByCategories, required this.product});
}

class CalculateBill extends BillingEvents {
  final List<SelectedProductModel> selectedProducts;
  final List<CategoryWithProductsDatum> productsByCategories;
  final double discount;

  CalculateBill(
      {required this.discount,
      required this.selectedProducts,
      required this.productsByCategories});
}

class AddOrderToPayLater extends BillingEvents {}

class RemovePendingOrder extends BillingEvents {
  final int orderID;

  RemovePendingOrder({required this.orderID});
}

class SettleOrder extends BillingEvents {
  final String paymentMethod;

  SettleOrder({required this.paymentMethod});
}
