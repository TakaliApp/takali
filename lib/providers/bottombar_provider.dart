import 'package:flutter/material.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/providers/base.provider.dart';

class BottomNavigationProvider extends BaseProvider {
  int _currentIndex = 0;
  String _currentRoute = RoutePaths.home;

  int get currentIndex => _currentIndex;
  String get currentRoute => _currentRoute;

  void setIndex(int index, BuildContext context) {
    _currentIndex = index;
    switch (index) {
      case 0:
        _currentRoute = RoutePaths.home;
        break;
      case 1:
        _currentRoute = RoutePaths.match;
        break;
    }
    notifyListeners();
  }
}
