import 'dart:async';

import 'package:flutter/material.dart';

import '../../viewmodels/base.viewmodel.dart';

class OtpViewModel extends BaseViewModel {
  int _countdown = 20;
  bool _isResendEnabled = false;
  Timer? _timer;

  int get countdown => _countdown;
  bool get isResendEnabled => _isResendEnabled;

  void initializeTimer() {
    startTimer();
  }

  void destroyTimer() {
    _timer?.cancel;
  }

  void startTimer() {
    _countdown = 20;
    _isResendEnabled = false;
    notifyListeners();
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
      } else {
        timer.cancel();
        _isResendEnabled = true;
      }
      notifyListeners();
    });
  }

  void handleOtpInput(int index, String value, List<FocusNode> focusNodes) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
  }

}