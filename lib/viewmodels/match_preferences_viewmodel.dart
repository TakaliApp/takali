import 'package:flutter/material.dart';
import 'package:takali/viewmodels/base.viewmodel.dart';

class MatchPreferencesViewModel extends BaseViewModel {
  final List<String> options = [
    'Une relation sérieuse',
    'De nouveaux amis',
    'Je ne suis pas sûr(e)',
  ];

  String? _selectedOption;

  String? get selectedOption => _selectedOption;

  void selectOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }

  void submitSelection() {
    if (_selectedOption != null) {
      print('Option sélectionnée : $_selectedOption');
      // Ajoutez ici la logique pour soumettre la sélection
    }
  }
}