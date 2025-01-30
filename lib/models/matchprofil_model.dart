import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchProfileModel {
  final String username;
  final DateTime birthday;
  final DateTime createdAt;
  final String gender;
  final List<String>? photoUrl;
  final String genderPreference;
  final bool isDeletedAccount;
  final String localization;
  final String lookingFor;
  final String phone;
  final List<String> referralSource;

  MatchProfileModel({
    required this.username,
    required this.birthday,
    required this.createdAt,
    required this.gender,
    required this.genderPreference,
    required this.isDeletedAccount,
    required this.localization,
    required this.lookingFor,
    required this.phone,
    required this.referralSource,
    this.photoUrl,
  });

  /// Factory method to map Firestore data to MatchProfileModel
 factory MatchProfileModel.fromMap(Map<String, dynamic> map) {
  return MatchProfileModel(
    username: map['username'] ?? '',
    birthday: _convertTimestamp(map['birthday']),
    createdAt: _convertTimestamp(map['createdAt']),
    gender: map['gender'] ?? '',
    photoUrl: (map['photos'] as List<dynamic>?)
        ?.map((photo) => photo['url'].toString())
        .toList() ?? [],
    genderPreference: map['gender_preference'] ?? '',
    isDeletedAccount: map['isDeletedAccount'] ?? false,
    localization: map['localization'] ?? '',
    lookingFor: map['lookingFor'] ?? '',
    phone: map['phone'] ?? '',
    referralSource: List<String>.from(map['referralSource'] ?? []),
  );
}
  /// Method to convert the DateTime into a readable format
  String getFormattedBirthday() {
    return DateFormat('dd MMMM yyyy').format(birthday);
  }

  String getFormattedCreatedAt() {
    return DateFormat('dd MMMM yyyy, HH:mm').format(createdAt);
  }

  /// Helper method to handle potential null or incorrect Timestamp types
  static DateTime _convertTimestamp(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    } else if (value is DateTime) {
      return value;
    } else if (value is String) {
      return DateTime.parse(value);
    } else {
      throw ArgumentError('Invalid date value: $value');
    }
  }
}