import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  // * (default) TextTheme
  TextStyle? get displayLarge => theme.textTheme.displayLarge;
  TextStyle? get displayMedium => theme.textTheme.displayMedium;
  TextStyle? get displaySmall => theme.textTheme.displaySmall;

  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;
  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;
  TextStyle? get headlineSmall => theme.textTheme.headlineSmall;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;
  TextStyle? get titleMedium => theme.textTheme.titleMedium;
  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  TextStyle? get labelLarge => theme.textTheme.labelLarge;
  TextStyle? get labelMedium => theme.textTheme.labelMedium;
  TextStyle? get labelSmall => theme.textTheme.labelSmall;

  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;
  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  // * PrimaryTextTheme
  TextStyle? get pdisplayLarge => theme.primaryTextTheme.displayLarge;
  TextStyle? get pdisplayMedium => theme.primaryTextTheme.displayMedium;
  TextStyle? get pdisplaySmall => theme.primaryTextTheme.displaySmall;

  TextStyle? get pheadlineLarge => theme.primaryTextTheme.headlineLarge;
  TextStyle? get pheadlineMedium => theme.primaryTextTheme.headlineMedium;
  TextStyle? get pheadlineSmall => theme.primaryTextTheme.headlineSmall;

  TextStyle? get ptitlelarge => theme.primaryTextTheme.titleLarge;
  TextStyle? get ptitleMedium => theme.primaryTextTheme.titleMedium;
  TextStyle? get ptitleSmall => theme.primaryTextTheme.titleSmall;

  TextStyle? get plabelLarge => theme.primaryTextTheme.labelLarge;
  TextStyle? get plabelMedium => theme.primaryTextTheme.labelMedium;
  TextStyle? get plabelSmall => theme.primaryTextTheme.labelSmall;

  TextStyle? get pbodyLarge => theme.primaryTextTheme.bodyLarge;
  TextStyle? get pbodyMedium => theme.primaryTextTheme.bodyMedium;
  TextStyle? get pbodySmall => theme.primaryTextTheme.bodySmall;
}