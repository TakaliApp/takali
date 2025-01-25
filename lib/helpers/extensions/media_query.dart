import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  double get screenWidth => mediaQueryData.size.width;
  double get screenHeight => mediaQueryData.size.height;

  double scaleWidth(double factor) => screenWidth * factor;
  double scaleHeight(double factor) => screenHeight * factor;
}