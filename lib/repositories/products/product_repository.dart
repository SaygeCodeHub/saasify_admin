import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';

abstract class ProductRepository {
  Future<ProductListModel> fetchProductList(
      String userId, String companyId, int branchId);

  Future<FetchAllCategoriesModel> fetchAllCategoriesModel();

  Future<dynamic> saveProduct(String userId, String companyId, int branchId);

  Future<dynamic> deleteProduct(String userId, String companyId, int branchId);
}
