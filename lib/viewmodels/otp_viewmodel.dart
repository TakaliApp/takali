import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/routes.dart';

import '../../viewmodels/base.viewmodel.dart';

class OtpViewModel extends BaseViewModel {
  int _countdown = 20;
  bool _isResendEnabled = false;
  Timer? _timer;
  final List<String> _otpDigits = List.filled(6, '');

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

  void handleOtpInput(int index, String value, List<FocusNode> focusNodes,
    String verificationId,
    BuildContext context
  ) {
    _otpDigits[index] = value;

    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
  
    if (_otpDigits.every((digit) => digit.isNotEmpty)) {
      final fullCode = _otpDigits.join();
      verifyOtp(fullCode, verificationId, context);
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyOtp(String code, String verificationId, BuildContext context) async {
    if (code.length != 6) return;
    setState(ViewModelState.busy);
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );
      
      final userCredential = await _auth.signInWithCredential(credential);
      
      if (userCredential.user != null && context.mounted) {
        if (userCredential.additionalUserInfo?.isNewUser ?? false) {
          Navigator.pushNamed(context, RoutePaths.profile);
        } else {
          Navigator.pushReplacementNamed(context, RoutePaths.home);
        }
      }
      _resetOtpFields();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code invalide: ${e.message}')),
      );
    } finally {
      setState(ViewModelState.idle);
    }
  }

  void _resetOtpFields() {
    _otpDigits.fillRange(0, 6, '');
    notifyListeners();
  }
}