import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/viewmodels/base.viewmodel.dart';

class UserInfoViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _userId;

  String firstName = '';
  DateTime? birthDate;
  String gender = '';
  String preferredGender = '';
  String location = '';

  void submitUserInfo(BuildContext context) async {
    setState(ViewModelState.busy);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'phone': user.phoneNumber,
          'username': firstName,
          'birthday': Timestamp.fromDate(birthDate!),
          'gender': gender,
          'gender_preference': preferredGender,
          'localization': location,
          'isDeletedAccount': false,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        
        Navigator.pushNamed(context, RoutePaths.referralSource);
      }
    } finally {
      setState(ViewModelState.idle);
    }
  }
}