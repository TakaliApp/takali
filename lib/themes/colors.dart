import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /*
  ** Color Primitives
  */

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x2E335AFF),
      Color(0x010004FF),
    ],
  );

  static const ColorSwatch green = MaterialColor(
    0xFF87A922,
    <int, Color>{
      50: Color(0xFFDBEDA4),
      100: Color(0xFFD3E991),
      200: Color(0xFFC5E26D),
      300: Color(0xFFB6DB48),
      400: Color(0xFFA5CF29),
      500: Color(0xFF87A922),
      600: Color(0xFF7E9E1F),
      700: Color(0xFF75921D),
      800: Color(0xFF6B861A),
      900: Color(0xFF617A18),
    },
  );
  static const ColorSwatch blue = MaterialColor(
    0xFF3197B9,
    <int, Color>{
      50: Color(0xFFB1DCEA),
      100: Color(0xFFA2D5E6),
      200: Color(0xFF83C7DE),
      300: Color(0xFF64B9D6),
      400: Color(0xFF45ABCD),
      500: Color(0xFF3197B9),
      600: Color(0xFF2E8DAC),
      700: Color(0xFF2A829F),
      800: Color(0xFF277792),
      900: Color(0xFF236C84),
    },
  );

  static const ColorSwatch yellow = MaterialColor(
    0xFFF39C12,
    <int, Color>{
      50: Color(0xFFFBDCAA),
      100: Color(0xFFFAD599),
      200: Color(0xFFF8C777),
      300: Color(0xFFF6B855),
      400: Color(0xFFF4AA34),
      500: Color(0xFFF39C12),
      600: Color(0xFFE5920C),
      700: Color(0xFFD4870B),
      800: Color(0xFFC27C0A),
      900: Color(0xFFB07009),
    },
  );

  static const ColorSwatch red = MaterialColor(
    0xFFE74D3C,
    <int, Color>{
      50: Color(0xFFF6BFB9),
      100: Color(0xFFF5B3AB),
      200: Color(0xFFF1998F),
      300: Color(0xFFEE8074),
      400: Color(0xFFEA6658),
      500: Color(0xFFE74D3C),
      600: Color(0xFFE53C29),
      700: Color(0xFFDE2F1B),
      800: Color(0xFFCB2B19),
      900: Color(0xFFB92717),
    },
  );

  static const ColorSwatch grey = Colors.grey;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF393D47);

  /*
  **  App Colors
  */
  // Primary
  static const ColorSwatch primary = MaterialColor(
    0xFFFFDE59,
    <int, Color>{
      50: Color(0xFFFFF9E6),
      100: Color(0xFFFFF3CC),
      200: Color(0xFFFFECA6),
      300: Color(0xFFFFE680),
      400: Color(0xFFFFE266),
      500: Color(0xFFFFDE59),
      600: Color(0xFFE6C850),
      700: Color(0xFFCCB247),
      800: Color(0xFFB39C3E),
      900: Color(0xFF998635),
    },
  );
  static Color primaryLite = primary[400]!;
  static Color primaryDeep = primary[900]!;

  // secondary
  static const ColorSwatch secondary = MaterialColor(
    0xFF561C91,
    <int, Color>{
      50: Color(0xFFEAE0F4),
      100: Color(0xFFD5C1E9),
      200: Color(0xFFAA83D3),
      300: Color(0xFF8045BD),
      400: Color(0xFF6B31A7),
      500: Color(0xFF561C91),
      600: Color(0xFF4D1983),
      700: Color(0xFF441675),
      800: Color(0xFF3B1367),
      900: Color(0xFF321059),
    },
  );
  static Color secondaryLite = secondary[200]!;
  static Color secondaryDeep = secondary[900]!;

  // signals
  static const Color success = green;
  static const Color warning = yellow;
  static const Color danger = red;

  // Border / outline
  static Color outline = grey[800]!;

  // disabled
  static Color disabled = grey[600]!;

  // Color Shcemes
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: black,
    primaryContainer: primary[400]!,
    onPrimaryContainer: primary[900]!,
    secondary: secondary,
    onSecondary: white,
    secondaryContainer: secondary[200]!,
    onSecondaryContainer: secondary[900]!,
    error: danger,
    onError: white,
    errorContainer: red[300]!,
    onErrorContainer: red[800]!,
    surface: white,
    onSurface: black,
    outline: black.withOpacity(0.12),
  );

  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary[400]!,
    onPrimary: black,
    primaryContainer: primary[600]!,
    onPrimaryContainer: primary[100]!,
    secondary: secondary[200]!,
    onSecondary: secondary[900]!,
    secondaryContainer: secondary[600]!,
    onSecondaryContainer: secondary[100]!,
    error: red[300]!,
    onError: red[900]!,
    errorContainer: red[800]!,
    onErrorContainer: red[300]!,
    surface: black,
    onSurface: white,
    outline: white.withOpacity(0.12),
  );
}