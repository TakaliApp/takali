import 'package:flutter/material.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/routes.dart';
import '../../viewmodels/base.viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(BuildContext context, String phoneNumber) async {
    setState(ViewModelState.busy);
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          debugPrint("Verification completed !");
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erreur: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          if (context.mounted) {
            Navigator.pushNamed(
              context,
              RoutePaths.verification,
              arguments: verificationId,
            );
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } finally {
      setState(ViewModelState.idle);
    }
  }
}