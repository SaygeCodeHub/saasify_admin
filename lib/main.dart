import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/firebase_options.dart';
import 'package:saasify/screens/common/cannot_be_minimized_screen.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen_new.dart';
import 'package:saasify/utils/database_util.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/pos/billing_bloc.dart';
import 'configs/app_theme.dart';
import 'package:flutter/material.dart';
import 'data/models/billing/bill_model.dart';
import 'data/models/billing/fetch_products_by_category_model.dart';
import 'data/models/billing/selected_product_model.dart';
import 'data/models/hive_keys.dart';
import 'di/app_module.dart';

void main() async {
  await _initFirebase();
  await _initDependencies();
  await _initApp();
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

_initApp() async {
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
  DatabaseUtil.ordersBox = await Hive.openBox(HiveKeys.ordersBox);
  DatabaseUtil.products = await Hive.openBox(HiveKeys.products);
  DatabaseUtil.companyDetails = await Hive.openBox(HiveKeys.companyDetails);
  DatabaseUtil.completedOrdersBox =
      await Hive.openBox(HiveKeys.completedOrdersBox);
}

class MyPosApp extends StatelessWidget {
  const MyPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              lazy: false,
              create: (context) =>
                  AuthenticationBloc()..add(CheckIfLoggedIn())),
          BlocProvider(lazy: false, create: (context) => OnboardingBloc()),
          BlocProvider(lazy: false, create: (context) => ProductBloc()),
          BlocProvider(lazy: false, create: (context) => BillingBloc()),
          BlocProvider(lazy: false, create: (context) => UploadBloc()),
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
              home: context.responsive(const CannotBeMinimizeScreen(),
                  tablets:
                      BlocListener<AuthenticationBloc, AuthenticationStates>(
                    listener: (context, state) {
                      if (state is IsLoggedIn) {
                        // Navigator.pushReplacementNamed(
                        //     context, DashboardsScreen.routeName);
                      } else if (state is LoggedOut) {
                        log('message');
                        Navigator.pushNamedAndRemoveUntil(context,
                            AuthenticationScreen.routeName, (route) => false);
                      }
                    },
                    child: const DashboardsScreen(),
                  )),
            )));
  }
}
