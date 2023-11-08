import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import '../../di/app_module.dart';
import '../../repositories/products/product_repository.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final ProductRepository productRepository = getIt<ProductRepository>();

  ProductStates get initialState => ProductInitial();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProductList>(_fetchProductList);
  }

  FutureOr<void> _fetchProductList(
      FetchProductList event, Emitter<ProductStates> emit) async {
    emit(FetchingProduct());
    // try {
    ProductListModel productListModel = await productRepository.productList();
    if (productListModel.data.isNotEmpty) {
      emit(FetchedProduct(productListModel: productListModel));
    } else {
      emit(FetchProductError(message: e.toString()));
    }
    // } catch (e) {
    //   emit(FetchProductError(message: e.toString()));
    // }
  }
}
