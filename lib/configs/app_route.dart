import 'package:flutter/material.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/list_of_companies_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/pos/pos_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen_new.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import '../screens/onboarding/auhentication_screen.dart';
import '../screens/product/add_product_screen.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return _createRoute(AuthenticationScreen());
      case BillingScreen.routeName:
        return _createRoute(BillingScreen());
      case DashboardsScreen.routeName:
        return _createRoute(DashboardsScreen());
      case ProductListScreen.routeName:
        return _createRoute(ProductListScreen());
      case InventoryListScreen.routeName:
        return _createRoute(InventoryListScreen());
      case POSTwoScreen.routeName:
        return _createRoute(const POSTwoScreen());
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
      pageBuilder: (context, animation, secondaryAnimation) => view,
    );
  }
}
