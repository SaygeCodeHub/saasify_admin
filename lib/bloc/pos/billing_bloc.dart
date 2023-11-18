import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../data/models/billing/bill_model.dart';
import '../../data/models/billing/selected_product_model.dart';
import '../../data/models/hive_keys.dart';
import '../../di/app_module.dart';
import '../../repositories/billing/billing_repository.dart';
import '../../utils/database_util.dart';
import 'billing_event.dart';
import 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvents, BillingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final BillingRepository _billingRepository = getIt<BillingRepository>();
  List<SelectedProductModel> selectedProducts = [];
  String customerContact = '-';
  int selectedCategoryIndex = 0;
  BillModel billDetails =
      BillModel(itemTotal: 0, total: 0, additionalCharges: 0, gSTCharges: 0);
  bool billExpanded = false;
  int orderIndex = 1;
  int completedOrderIndex = 0;

  BillingBloc() : super(BillingInitial()) {
    on<LoadAllOrders>(_loadAllOrders);
    on<BillingInitialEvent>(_billingInitialEvent);
    on<FetchProductsByCategory>(_fetchProductsByCategory);
    on<SelectCategory>(_selectCategory);
    on<SelectProduct>(_selectProduct);
    on<RemoveProduct>(_removeProduct);
    on<CalculateBill>(_calculateBill);
    on<ExpandBilling>(_expandBilling);
    on<AddOrderToPayLater>(_addOrderToPayLater);
    on<SettleOrder>(_settleOrder);
  }

  FutureOr<void> _loadAllOrders(
      LoadAllOrders event, Emitter<BillingStates> emit) async {
    List<dynamic> customerIdList = [];

    customerIdList = DatabaseUtil.ordersBox.keys.toList();

    if (DatabaseUtil.ordersBox.isEmpty) {
      add(BillingInitialEvent(orderIndex: orderIndex));
    } else {
      emit(LoadDataBaseOrders(customerIdList: customerIdList));
    }
  }

  FutureOr<void> _billingInitialEvent(
      BillingInitialEvent event, Emitter<BillingStates> emit) async {
    if (DatabaseUtil.ordersBox.isNotEmpty && event.orderIndex != -1) {
      orderIndex = event.orderIndex;
      selectedProducts =
          DatabaseUtil.ordersBox.get(event.orderIndex)["orderItems"];
      billDetails = DatabaseUtil.ordersBox.get(event.orderIndex)["billDetails"];
    } else {
      orderIndex = DatabaseUtil.ordersBox.length + 1;
      selectedCategoryIndex = 0;
      selectedProducts = [];
      billDetails = BillModel(
          itemTotal: 0, total: 0, additionalCharges: 0, gSTCharges: 0);
    }

    add(FetchProductsByCategory());
  }

  FutureOr<void> _fetchProductsByCategory(
      FetchProductsByCategory event, Emitter<BillingStates> emit) async {
    emit(FetchingProductsByCategory());
    // try {
    List<CategoryWithProductsDatum> data = [];
    FetchProductsByCategoryModel fetchProductsByCategoryModel;
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();
    if (DatabaseUtil.products.isEmpty) {
      fetchProductsByCategoryModel = await _billingRepository
          .fetchProductsByCategory(userId, companyId, branchId);
      data = fetchProductsByCategoryModel.data;
      DatabaseUtil.products.put('products', fetchProductsByCategoryModel.data);
    } else {
      data = DatabaseUtil.products
          .get('products')
          .cast<CategoryWithProductsDatum>();
    }

    emit(ProductsLoaded(
        productsByCategories: data,
        selectedCategoryIndex: selectedCategoryIndex,
        selectedProducts: selectedProducts,
        billDetails: billDetails));
    // } catch (e) {
    //   emit(ErrorFetchingProductsByCategory());
    // }
  }

  FutureOr<void> _selectCategory(
      SelectCategory event, Emitter<BillingStates> emit) async {
    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: selectedProducts,
        billDetails: billDetails));
  }

  FutureOr<void> _selectProduct(
      SelectProduct event, Emitter<BillingStates> emit) async {
    if (selectedProducts.isNotEmpty) {
      if (selectedProducts
          .map((e) => e.product.variants[0].variantId)
          .contains(event.product.variants[event.variantIndex].variantId)) {
        selectedProducts
            .firstWhere((element) =>
                element.product.variants[0].variantId ==
                event.product.variants[event.variantIndex].variantId)
            .count++;
      } else {
        selectedProducts.add(SelectedProductModel(
            count: 1,
            product: Product(
                productId: event.product.productId,
                productName: event.product.productName,
                variants: [event.product.variants[event.variantIndex]],
                brandName: event.product.brandName,
                productDescription: event.product.productDescription,
                brandId: event.product.brandId)));
      }
    } else {
      selectedProducts
          .add(SelectedProductModel(count: 1, product: event.product));
    }
    add(CalculateBill(
        discount: 10,
        selectedProducts: selectedProducts,
        productsByCategories: event.productsByCategories));
  }

  FutureOr<void> _removeProduct(
      RemoveProduct event, Emitter<BillingStates> emit) async {
    if (selectedProducts
            .firstWhere((element) =>
                element.product.variants[0].variantId ==
                event.product.variants[0].variantId)
            .count >
        1) {
      selectedProducts
          .firstWhere(
              (element) => element.product.productId == event.product.productId)
          .count--;
    } else if (selectedProducts
            .firstWhere((element) =>
                element.product.productId == event.product.productId)
            .count ==
        1) {
      selectedProducts.remove(selectedProducts.firstWhere(
          (element) => element.product.productId == event.product.productId));
    }

    add(CalculateBill(
        discount: 10,
        selectedProducts: selectedProducts,
        productsByCategories: event.productsByCategories));
  }

  FutureOr<void> _calculateBill(
      CalculateBill event, Emitter<BillingStates> emit) async {
    billDetails.itemTotal = 0;

    for (var i = 0; i < selectedProducts.length; i++) {
      billDetails.itemTotal += selectedProducts[i].product.variants[0].cost *
          selectedProducts[i].count;
    }

    billDetails.gSTCharges = billDetails.itemTotal * 0.1;
    billDetails.additionalCharges = 50;

    billDetails.total = billDetails.itemTotal +
        billDetails.gSTCharges +
        billDetails.additionalCharges;

    DatabaseUtil.ordersBox.put(orderIndex,
        {"orderItems": selectedProducts, "billDetails": billDetails});

    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: selectedProducts,
        billDetails: billDetails));
  }

  FutureOr<void> _expandBilling(
      ExpandBilling event, Emitter<BillingStates> emit) async {
    billExpanded = !billExpanded;

    emit(ProductsLoaded(
        selectedCategoryIndex: selectedCategoryIndex,
        productsByCategories: event.productsByCategories,
        selectedProducts: selectedProducts,
        billDetails: billDetails));
  }

  FutureOr<void> _addOrderToPayLater(
      AddOrderToPayLater event, Emitter<BillingStates> emit) async {
    DatabaseUtil.ordersBox.put(orderIndex,
        {"orderItems": selectedProducts, "billDetails": billDetails});
    add(LoadAllOrders());
  }

  FutureOr<void> _settleOrder(
      SettleOrder event, Emitter<BillingStates> emit) async {
    DatabaseUtil.ordersBox.delete(orderIndex);
    String companyName = DatabaseUtil.companyDetails
        .get(HiveKeys.companyDetails)['company_name'];
    String orderID =
        '${companyName.substring(0, 2)}-${DateTime.now().microsecondsSinceEpoch.toString()}';

    List<Map<String, int>> productList = [];

    for (SelectedProductModel selectProduct in selectedProducts) {
      productList.add({
        "product_id": selectProduct.product.productId,
        "variant_id": selectProduct.product.variants[0].variantId,
        "count": selectProduct.count
      });
    }

    Map<String, dynamic> orderMap = {
      "order_no": orderID,
      "product_list": productList,
      "item_total": billDetails.itemTotal,
      "gst": billDetails.gSTCharges,
      "additional_charges": billDetails.additionalCharges,
      "total": billDetails.total,
    };
    log(orderMap.toString());

    // if (MasterConfigs.isOffline) {
    //   completedOrderIndex = DatabaseUtil.completedOrdersBox.length;
    //   DatabaseUtil.completedOrdersBox.put(completedOrderIndex, {
    //     "customerContact": customerContact,
    //     "paymentMethod": event.paymentMethod,
    //     "orderID": orderID,
    //     "orderItems": selectedProducts,
    //     "billDetails": billDetails
    //   });
    // } else {
    //   // write online code here //////////
    // }

    completedOrderIndex++;
    add(LoadAllOrders());
  }
}
