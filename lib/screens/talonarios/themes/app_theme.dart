import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(90, 97, 195, 1);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color.fromRGBO(90, 97, 195, 1),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryColor)));
}
