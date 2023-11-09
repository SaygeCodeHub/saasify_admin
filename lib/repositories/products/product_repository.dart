import 'package:saasify/data/models/products/product_list_model.dart';

abstract class ProductRepository {
  Future<ProductListModel> productList();
}
