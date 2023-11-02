import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'bloc/onboarding/onboarding_event.dart';
import 'configs/app_theme.dart';
import 'package:flutter/material.dart';

import 'di/app_module.dart';

void main() async {
  await _initDependencies();
  runApp(const MyPosApp());
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
            create: (context) => AuthenticationBloc()),
        BlocProvider(
            lazy: false,
            create: (context) => OnboardingBloc()..add(CheckIfLoggedIn())),
      ],
      child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
              theme: themeData,
              home: BlocBuilder<OnboardingBloc, OnboardingStates>(
                builder: (context, state) {
                  if (state is IsLoggedIn) {
                    return const Scaffold();
                  } else {
                    context.read<AuthenticationBloc>().add(SwitchAuthentication(
                        isLogin: false, passwordHidden: false));
                    return AuthenticationScreen();
                  }}
                  ))));
  }
}
