import 'package:flutter/material.dart';

class Themes {
  static const defaultPrimaryColor = Color(0xFF2c48d3);
  static const defaultSecondaryColor = Color(0xFFa65bff);
  static const defaultTertiaryColor = Color(0xFFe7ad3a);

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultPrimaryColor,
      secondary: defaultSecondaryColor,
      tertiary: defaultTertiaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: 'Anuphan',
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultPrimaryColor,
      secondary: defaultSecondaryColor,
      tertiary: defaultTertiaryColor,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Anuphan',
  );
}
