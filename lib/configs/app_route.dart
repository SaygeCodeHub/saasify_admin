import 'package:flutter/material.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/list_of_companies_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import '../screens/onboarding/auhentication_screen.dart';
import '../screens/product/add_product_screen.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return _createRoute(AuthenticationScreen());
      case DashboardsScreen.routeName:
        return _createRoute(const DashboardsScreen());
      case ProductListScreen.routeName:
        return _createRoute(const ProductListScreen());
      case CompanyListScreen.routeName:
        return _createRoute(CompanyListScreen(
            companyList: settings.arguments as List<Company>));
      case BranchesListScreen.routeName:
        return _createRoute(
            BranchesListScreen(selectedCompany: settings.arguments as Company));
      case AddProductScreen.routeName:
        return _createRoute(const AddProductScreen());

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
