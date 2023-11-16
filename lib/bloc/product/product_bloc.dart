import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/products/delete_product_model.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/products/save_product_model.dart';
import '../../di/app_module.dart';
import '../../repositories/products/product_repository.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final ProductRepository _productRepository = getIt<ProductRepository>();

  ProductStates get initialState => ProductInitial();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProductList>(_fetchProductList);
    on<SaveProduct>(_saveProduct);
    on<EditProduct>(_editProduct);
    on<DeleteProducts>(_deleteProducts);
    on<ProductSelected>(_productSelected);
    on<FetchAllCategories>(_fetchAllCategories);
  }

  FutureOr<void> _fetchProductList(
      FetchProductList event, Emitter<ProductStates> emit) async {
    emit(FetchingProduct());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();
      FetchProductListModel fetchproductListModel = await _productRepository
          .fetchProductList(userId, companyId, branchId);
      if (fetchproductListModel.status == 200) {
        emit(FetchedProduct(productList: fetchproductListModel.data));
      } else {
        emit(ErrorFetchingProduct(message: fetchproductListModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingProduct(message: e.toString()));
    }
  }

  FutureOr<void> _saveProduct(
      SaveProduct event, Emitter<ProductStates> emit) async {
    emit(SavingProduct());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      debugPrint(jsonEncode(event.productDetailsMap));

      SaveProductModel saveProductModel = await _productRepository.saveProduct(
          userId, companyId, branchId, event.productDetailsMap);

      if (saveProductModel.status == 200) {
        emit(SavedProduct(
            message: saveProductModel.message, data: saveProductModel.data));
      } else {
        emit(ErrorSavingProduct(message: saveProductModel.message));
      }
    } catch (e) {
      emit(ErrorSavingProduct(message: e.toString()));
    }
  }

  FutureOr<void> _editProduct(
      EditProduct event, Emitter<ProductStates> emit) async {
    emit(EditingProduct());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      log(jsonEncode(event.productDetailsMap));

      SaveProductModel saveProductModel = await _productRepository.saveProduct(
          userId, companyId, branchId, event.productDetailsMap);

      if (saveProductModel.status == 200) {
        emit(EditedProduct(message: saveProductModel.message));
      } else {
        emit(ErrorEditingProduct(message: saveProductModel.message));
      }
    } catch (e) {
      emit(ErrorEditingProduct(message: e.toString()));
    }
  }

  FutureOr<void> _deleteProducts(
      DeleteProducts event, Emitter<ProductStates> emit) async {
    emit(DeletingProducts());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      Map idsMap = {"variant_ids": event.variantIds};

      DeleteProductsModel deleteProductsModel = await _productRepository
          .deleteProduct(userId, companyId, branchId, idsMap);

      if (deleteProductsModel.status == 200) {
        emit(DeletedProducts(message: deleteProductsModel.message));
      } else {
        emit(ErrorDeletingProducts(message: deleteProductsModel.message));
      }
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _productSelected(
      ProductSelected event, Emitter<ProductStates> emit) async {
    emit(FetchedProduct(productList: event.productList));
  }

  FutureOr<void> _fetchAllCategories(
      FetchAllCategories event, Emitter<ProductStates> emit) async {
    emit(FetchingCategories());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      FetchAllCategoriesModel fetchAllCategoriesModel = await _productRepository
          .fetchAllCategories(userId, companyId, branchId);
      log('api called');
      if (fetchAllCategoriesModel.status == 200) {
        log('api success');
        emit(FetchedCategories(categoryList: fetchAllCategoriesModel.data));
      } else {
        log('api failed');
        emit(ErrorFetchingCategories(message: fetchAllCategoriesModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingCategories(message: e.toString()));
    }
  }
}
