import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color.fromRGBO(250, 250, 250, 1); // Light background
  static const Color gradient1 = Color.fromRGBO(255, 183, 77, 1); // Light orange
  static const Color gradient2 = Color.fromRGBO(255, 138, 101, 1); // Light coral
  static const Color gradient3 = Color.fromRGBO(255, 112, 67, 1); // Lighter coral
  static const Color borderColor = Color.fromRGBO(220, 220, 220, 1); // Light grey
  static const Color blackColor = Colors.black54;
  static const Color greyColor = Colors.grey;
  static const Color errorColor = Color.fromRGBO(255, 82, 82, 1); // Light red accent
  static const Color transparentColor = Colors.transparent;
  static const double defaultPadding = 16;
  static final lightTheme = ThemeData.light(

  ).copyWith(
    scaffoldBackgroundColor: backgroundColor,
    chipTheme: ChipThemeData(
      color: WidgetStateProperty.all(backgroundColor),
      side: BorderSide.none
    ),
    inputDecorationTheme: InputDecorationTheme(

      contentPadding: const EdgeInsets.all(27),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 3
        ),
        borderRadius: BorderRadius.circular(13)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: borderColor,
              width: 4
          ),
          borderRadius: BorderRadius.circular(15)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: errorColor,
              width: 4
          ),
          borderRadius: BorderRadius.circular(15)
      ) ,

      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: gradient2,
              width: 3
          ),
          borderRadius: BorderRadius.circular(15)
      ),
    )
  );
}