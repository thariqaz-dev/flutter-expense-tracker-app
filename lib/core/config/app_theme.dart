import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: Color(0XFF9C27B0),
  );

  static ColorScheme KDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color(0xFFAB47BC),
  );

  static ThemeData get lightTheme {
    return ThemeData().copyWith(
      brightness: Brightness.light,
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shadowColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: KDarkColorScheme,
      cardTheme: CardTheme().copyWith(
        color: KDarkColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shadowColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KDarkColorScheme.primaryContainer,
          foregroundColor: KDarkColorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: KDarkColorScheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
    );
  }
}
