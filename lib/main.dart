import 'package:shared_preferences/shared_preferences.dart';
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
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
            theme: themeData,
            home: const Scaffold()));
  }
}
