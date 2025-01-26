import 'package:flutter/material.dart';
import 'package:takali/viewmodels/base.viewmodel.dart';

class UserInfoViewModel extends BaseViewModel {
  String firstName = '';
  DateTime? birthDate;
  String gender = '';
  String preferredGender = '';
  String location = '';

  void submitUserInfo() {
    // Implémentez la logique de soumission ici
    print('''
      Informations soumises :
      Prénom: $firstName
      Date de naissance: $birthDate
      Genre: $gender
      Préférence: $preferredGender
      Localisation: $location
    ''');
  }
}