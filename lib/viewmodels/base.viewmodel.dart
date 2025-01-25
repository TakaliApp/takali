import 'package:flutter/material.dart';

import '../constants/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewModelState _state = ViewModelState.idle;

  ViewModelState get state => _state;

  void setState(ViewModelState value) {
    _state = value;
    notifyListeners();
  }
}