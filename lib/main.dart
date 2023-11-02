import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/onboarding/company_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'bloc/authentication/authentication_states.dart';
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
            create: (context) => AuthenticationBloc()..add(CheckIfLoggedIn())),
      ],
      child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
              theme: appTheme,
              home: BlocBuilder<AuthenticationBloc, AuthenticationStates>(
                builder: (context, state) {
                  if (state is LoggedIn) {
                    return const Scaffold();
                  } else {
                    context
                        .read<AuthenticationBloc>()
                        .add(SwitchLoginScreenEvent(isLogin: false));
                    return CompanyForm();
                  }
                },
              ))),
    );
  }
}
