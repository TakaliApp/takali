import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/viewmodels/base.viewmodel.dart';

class MatchPreferencesViewModel extends BaseViewModel {
  final List<String> options = [
    'Une relation sérieuse',
    'De nouveaux amis',
    'Je ne suis pas sûr(e)',
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _selectedOption;

  String? get selectedOption => _selectedOption;

  void selectOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }

  Future<void> submitSelection(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && _selectedOption != null) {
      debugPrint('Option sélectionnée : $_selectedOption');
      await _firestore.collection('users').doc(user.uid).update({
        'lookingFor': _selectedOption,
      });
      Navigator.pushReplacementNamed(context, RoutePaths.home);
    }
  }
}