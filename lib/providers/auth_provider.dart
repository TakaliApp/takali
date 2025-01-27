import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:takali/app_locator.dart';
import 'package:takali/services/auth_service.dart';
import 'package:takali/providers/base.provider.dart';

class AuthProvider extends BaseProvider {
  bool isUserLoggedIn;
  GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  AuthProvider() : isUserLoggedIn = locator<AuthService>().isUserLoggedIn;

  void onAuthStateChanged() {
    locator<Logger>().i("user auth state changed");
    isUserLoggedIn = locator<AuthService>().isUserLoggedIn;
    notifyListeners();
  }
}