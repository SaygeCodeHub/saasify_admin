import 'package:flutter/material.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/list_of_companies_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../data/models/orders/fetch_orders_model.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/settings/employee_list.dart';
import '../screens/settings/discount_screen.dart';
import '../screens/onboarding/auhentication_screen.dart';
import '../screens/orders/order_details_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/product/add_product_screen.dart';
import '../screens/settings/payment_type_screen.dart';
import '../screens/settings/profile_screen.dart';
import '../screens/settings/store_grid_screen.dart';
import '../screens/settings/add_employee_screen.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return _createRoute(AuthenticationScreen());
      case DashboardsScreen.routeName:
        return _createRoute(DashboardsScreen());

      case CategoriesScreen.routeName:
        return _createRoute(CategoriesScreen());

      case ProductListScreen.routeName:
        return _createRoute(ProductListScreen());
      case InventoryListScreen.routeName:
        return _createRoute(InventoryListScreen());
      case OrdersScreen.routeName:
        return _createRoute(OrdersScreen());
      case StoreGridScreen.routeName:
        return _createRoute(StoreGridScreen());
      case ProfileScreen.routeName:
        return _createRoute(ProfileScreen());
      case PaymentTypeScreen.routeName:
        return _createRoute(PaymentTypeScreen());
      case EmployeeListScreen.routeName:
        return _createRoute(EmployeeListScreen());
      case AddEmployeeScreen.routeName:
        return _createRoute(AddEmployeeScreen());
      case POSScreen.routeName:
        return _createRoute(POSScreen());

      case DiscountScreen.routeName:
        return _createRoute(DiscountScreen());

      case OrderDetailsScreen.routeName:
        return _createRoute(OrderDetailsScreen(
          orderListDatum: settings.arguments as Order,
        ));

      case CompanyListScreen.routeName:
        return _createRoute(CompanyListScreen(
            companyList: settings.arguments as List<Company>));
      case BranchesListScreen.routeName:
        return _createRoute(
            BranchesListScreen(selectedCompany: settings.arguments as Company));
      case AddProductScreen.routeName:
        AddProductScreenArguments args =
            settings.arguments as AddProductScreenArguments;
        return _createRoute(AddProductScreen(
            isEdit: args.isEdit,
            isVariant: args.isVariant,
            dataMap: args.dataMap,
            isProductDetail: args.isProductDetail));

      default:
        return _createRoute(AuthenticationScreen());
    }
  }

  static Route<dynamic> _createRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          context.responsive(const SizedBox(), mobile: view),
    );
  }
}
