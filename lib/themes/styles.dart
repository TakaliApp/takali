import 'package:flutter/material.dart';

import 'sizes.dart';

class TextStyles {
  TextStyles._(); // Private constructor to prevent instantiation

  static const fontFamily = "Harmonique";

  static TextStyle get displayLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displayLarge,
        fontWeight: FontWeight.w900,
      );
  static TextStyle get displayMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displayMedium,
      );
  static TextStyle get displaySmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displaySmall,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineLarge,
      );
  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineMedium,
      );
  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineSmall,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.titleLarge,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.titleMedium,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.titleSmall,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.labelLarge,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.labelMedium,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelSmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.labelSmall,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.bodyLarge,
      );
  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.bodyMedium,
      );
  static TextStyle get bodySmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.bodySmall,
      );
}