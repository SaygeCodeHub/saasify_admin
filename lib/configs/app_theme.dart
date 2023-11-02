import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
  colorScheme: colorScheme,
  fontFamily: 'Poppins',
  appBarTheme: appBarTheme,
  listTileTheme: listTileTheme,
  cardTheme: appCardTheme,
  bottomAppBarTheme: bottomAppBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  textButtonTheme: textButtonTheme,
  scaffoldBackgroundColor: AppColor.saasifyWhite,
  elevatedButtonTheme: elevatedButtonThemeData,
  floatingActionButtonTheme: floatingActionButtonThemeData,
  expansionTileTheme: expansionTileThemeData,
  iconTheme: iconThemeData,
  inputDecorationTheme: inputDecorationTheme,
);

ColorScheme colorScheme = const ColorScheme.light(
    surface: AppColor.saasifyWhite, background: AppColor.saasifyWhite);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.saasifyWhite),
    ),
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    fillColor: AppColor.saasifyLighterGrey,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.saasifyLightGrey),
    ),
    border: const OutlineInputBorder(),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.saasifyRed)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.saasifyWhite),
    ),
    hintStyle: const TextStyle(color: AppColor.saasifyLightGrey));

FloatingActionButtonThemeData floatingActionButtonThemeData =
    const FloatingActionButtonThemeData(
        backgroundColor: AppColor.saasifyWhite,
        iconSize: kFloatingActionButtonIconSize,
        foregroundColor: AppColor.saasifyWhite);

ExpansionTileThemeData expansionTileThemeData = ExpansionTileThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardRadius)),
    iconColor: AppColor.saasifyLightDeepBlue,
    textColor: AppColor.saasifyblack);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, kGeneralButtonHeight),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));

TextButtonThemeData textButtonTheme =
    TextButtonThemeData(style: TextButton.styleFrom(padding: EdgeInsets.zero));

BottomNavigationBarThemeData bottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
        backgroundColor: AppColor.saasifyWhite, elevation: kZero);

BottomAppBarTheme? bottomAppBarTheme = const BottomAppBarTheme(
    color: AppColor.saasifyWhite,
    elevation: kZero,
    padding: EdgeInsets.all(14));

ListTileThemeData listTileTheme = const ListTileThemeData(dense: true);

AppBarTheme appBarTheme = AppBarTheme(
    elevation: kZero,
    backgroundColor: AppColor.saasifyWhite,
    iconTheme: iconThemeData);

IconThemeData iconThemeData = const IconThemeData(color: AppColor.saasifyblack);

CardTheme appCardTheme =
    const CardTheme(elevation: kCardElevation, margin: EdgeInsets.zero);

extension AppTextTheme on TextTheme {
  TextStyle get xxxXTiniest {
    return const TextStyle(
        fontSize: 6, color: AppColor.saasifyblack, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTiniest {
    return const TextStyle(
        fontSize: 8, color: AppColor.saasifyblack, fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiniest {
    return const TextStyle(
        fontSize: 10,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTiniest {
    return const TextStyle(
        fontSize: 12,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get tiniest {
    return const TextStyle(
        fontSize: 14,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTinier {
    return const TextStyle(
        fontSize: 16,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxTinier {
    return const TextStyle(
        fontSize: 18,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTinier {
    return const TextStyle(
        fontSize: 20,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get tinier {
    return const TextStyle(
        fontSize: 22,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.normal);
  }

  TextStyle get tinierMedium {
    return const TextStyle(
        fontSize: 24,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.normal);
  }

  TextStyle get xxxTiny {
    return const TextStyle(
        fontSize: 26,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiny {
    return const TextStyle(
        fontSize: 28,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTiny {
    return const TextStyle(
        fontSize: 30,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }

  TextStyle get tiny {
    return const TextStyle(
        fontSize: 32,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }

  TextStyle get xxxSmallest {
    return const TextStyle(
        fontSize: 34,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }

  TextStyle get xxSmallest {
    return const TextStyle(
        fontSize: 36,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }

  TextStyle get xSmallest {
    return const TextStyle(
        fontSize: 38,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }

  TextStyle get smallest {
    return const TextStyle(
        fontSize: 40,
        color: AppColor.saasifyblack,
        fontWeight: FontWeight.w700);
  }
}
