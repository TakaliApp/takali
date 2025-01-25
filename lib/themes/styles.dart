import 'package:flutter/material.dart';

import 'sizes.dart';

class TextStyles {
  TextStyles._(); // Private constructor to prevent instantiation

  static const fontFamily = "Nunito";

  static TextStyle get displayLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displayLarge,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get displayMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displayMedium,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get displaySmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.displaySmall,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineLarge,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineMedium,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.headlineSmall,
        fontWeight: FontWeight.normal,
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
        fontWeight: FontWeight.normal,
      );
  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.bodyMedium,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get bodySmall => const TextStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.bodySmall,
        fontWeight: FontWeight.normal,
      );
}