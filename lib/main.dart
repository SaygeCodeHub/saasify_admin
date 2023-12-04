import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/bloc/branches/branches_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/customer/customer_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/profile/profile_bloc.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/data/database/database_util.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/customer_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import 'package:saasify/firebase_options.dart';
import 'package:saasify/screens/common/cannot_be_minimized_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/orders/orders_bloc.dart';
import 'bloc/pos/billing_bloc.dart';
import 'configs/app_theme.dart';
import 'package:flutter/material.dart';
import 'data/database/hive_keys.dart';
import 'di/app_module.dart';

void main() async {
  await _initFirebase();
  await _initDependencies();
  await _initHive();
  runApp(const MyPosApp());
}

_initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

_initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurableDependencies();
  await getIt.isReady<SharedPreferences>();
}

_initHive() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(SelectedProductModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(BillModelAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(ProductAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(VariantAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(CategoryWithProductsDatumAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(CustomerAdapter());
  }
  DatabaseUtil.ordersBox = await Hive.openBox(HiveKeys.ordersBox);
  DatabaseUtil.products = await Hive.openBox(HiveKeys.products);
}

class MyPosApp extends StatelessWidget {
  const MyPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              lazy: true,
              create: (context) =>
                  AuthenticationBloc()..add(CheckIfLoggedIn())),
          BlocProvider(lazy: true, create: (context) => OnboardingBloc()),
          BlocProvider(lazy: true, create: (context) => ProductBloc()),
          BlocProvider(lazy: true, create: (context) => BillingBloc()),
          BlocProvider(lazy: true, create: (context) => UploadBloc()),
          BlocProvider(lazy: true, create: (context) => InventoryBloc()),
          BlocProvider(lazy: true, create: (context) => CategoriesBloc()),
          BlocProvider(lazy: true, create: (context) => OrdersBloc()),
          BlocProvider(lazy: true, create: (context) => BranchesBloc()),
          BlocProvider(lazy: true, create: (context) => CustomerBloc()),
          BlocProvider(lazy: true, create: (context) => ProfileBloc()),
        ],
        child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                scrollBehavior:
                    const MaterialScrollBehavior().copyWith(scrollbars: false),
                onGenerateRoute: AppRoutes.routes,
                theme: appTheme,
                home: BlocListener<AuthenticationBloc, AuthenticationStates>(
                  listener: (context, state) {
                    if (state is IsLoggedIn) {
                      Navigator.pushReplacementNamed(
                          context, DashboardsScreen.routeName);
                    }
                  },
                  child: context.responsive(const CannotBeMinimizeScreen(),
                      desktop: AuthenticationScreen(),
                      tablets: AuthenticationScreen(),
                      mobile: AuthenticationScreen()), // Adj
                  // LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  // if (MobileResponsive.desktop(context)) {
                  //   return mobile:();
                  // } else if (ResponsiveLayout.isTablet(context)) {
                  //   return TabletScreen();
                  // } else {
                  //   return isPhone();
                  // }
                  //   if(constraints.maxWidth > 1200)
                  //   {
                  //   return UltraWideLayout();
                  //   } else if (constraints.maxWidth > 600)
                  //   {
                  //   return WideLayout();
                  //   }else{
                  //   return NarrowLayout();
                  //   }
                  // },

                  // )

                  // context.responsive(const CannotBeMinimizeScreen(),
                  //     tablets: AuthenticationScreen())
                ))));
  }
}
