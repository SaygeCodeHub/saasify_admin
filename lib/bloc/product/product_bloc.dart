import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import '../../di/app_module.dart';
import '../../repositories/products/product_repository.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final ProductRepository _productRepository = getIt<ProductRepository>();

  ProductStates get initialState => ProductInitial();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProductList>(_fetchProductList);
    on<SaveProduct>(_saveProduct);
    on<DeleteProducts>(_deleteProducts);
    on<ProductSelected>(_productSelected);
  }

  FutureOr<void> _fetchProductList(
      FetchProductList event, Emitter<ProductStates> emit) async {
    emit(FetchingProduct());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();
      ProductListModel productListModel = await _productRepository
          .fetchProductList(userId, companyId, branchId);
      if (productListModel.status == 200) {
        emit(FetchedProduct(productList: productListModel.data));
      } else {
        emit(FetchProductError(message: productListModel.message));
      }
    } catch (e) {
      emit(FetchProductError(message: e.toString()));
    }
  }

  FutureOr<void> _saveProduct(
      SaveProduct event, Emitter<ProductStates> emit) async {
    try {
      // String userId = await _customerCache.getUserId();
      // String companyId = await _customerCache.getCompanyId();
      // int branchId = await _customerCache.getBranchId();
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _deleteProducts(
      DeleteProducts event, Emitter<ProductStates> emit) async {
    try {
      // String userId = await _customerCache.getUserId();
      // String companyId = await _customerCache.getCompanyId();
      // int branchId = await _customerCache.getBranchId();
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _productSelected(
      ProductSelected event, Emitter<ProductStates> emit) async {
    emit(FetchedProduct(productList: event.productList));
  }
}
