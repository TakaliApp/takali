import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../viewmodels/base.viewmodel.dart';

class ReferralSourceViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveReferralSources(List<String> sources) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'referralSource': sources,
      });
    }
  }
}