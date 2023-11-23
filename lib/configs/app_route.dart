import 'package:flutter/material.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/common/cannot_be_minimized_screen.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/list_of_companies_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/orders/orders_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../screens/onboarding/auhentication_screen.dart';
import '../screens/orders/order_details_screen.dart';
import '../screens/product/add_product_screen.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return _createRoute(AuthenticationScreen());
      case DashboardsScreen.routeName:
        return _createRoute(DashboardsScreen());
      case ProductListScreen.routeName:
        return _createRoute(ProductListScreen());
      case InventoryListScreen.routeName:
        return _createRoute(InventoryListScreen());
      case OrdersScreen.routeName:
        return _createRoute(OrdersScreen());
      case POSScreen.routeName:
        return _createRoute(POSScreen());

      case OrderDetailsScreen.routeName:
        return _createRoute(OrderDetailsScreen());

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
            dataMap: args.dataMap));

      default:
        return _createRoute(AuthenticationScreen());
    }
  }

  static Route<dynamic> _createRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          context.responsive(const CannotBeMinimizeScreen(), tablets: view),
    );
  }
}
