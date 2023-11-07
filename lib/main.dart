import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/firebase_options.dart';
import 'package:saasify/screens/common/cannot_be_minimized_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'configs/app_theme.dart';
import 'package:flutter/material.dart';
import 'di/app_module.dart';

void main() async {
  await _initFirebase();
  await _initDependencies();
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

class MyPosApp extends StatelessWidget {
  const MyPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              lazy: false,
              create: (context) => AuthenticationBloc()
                ..add(SwitchAuthentication(isLogin: false, focusField: ''))),
          BlocProvider(
              lazy: false,
              create: (context) => OnboardingBloc()..add(CheckIfLoggedIn())),
        ],
        child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              scrollBehavior:
                  const MaterialScrollBehavior().copyWith(scrollbars: false),
              onGenerateRoute: AppRoutes.routes,
              theme: appTheme,
              home: context.responsive(const CannotBeMinimizeScreen(),
                  tablets: BlocListener<OnboardingBloc, OnboardingStates>(
                    listener: (context, state) {
                      if (state is IsLoggedIn) {
                        Navigator.pushReplacementNamed(
                            context, DashboardsScreen.routeName);
                      }
                    },
                    child: AuthenticationScreen(),
                  )),
            )));
  }
}
