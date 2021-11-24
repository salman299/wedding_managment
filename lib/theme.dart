import 'package:flutter/material.dart';
import 'package:wedding_management/size_config.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF8F8FA),
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryColor: kPrimaryColor,
    colorScheme: const ColorScheme(
      primary: kPrimaryColor,
      primaryVariant: kPrimaryColor,
      secondary: kSecondaryColor,
      secondaryVariant: kSecondaryColor,
      error: Colors.red,
      surface: Colors.white,
      background: kBackgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.black,
      brightness: Brightness.light,
      onError: Colors.red,
      onSurface: Colors.black,
    ),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(color: kTextColor, fontWeight: FontWeight.w700),
    headline2: TextStyle(color: kTextColor, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    subtitle1: TextStyle(color: kTextLightColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
