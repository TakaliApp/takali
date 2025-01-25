import 'package:hive/hive.dart';
import 'base.model.dart';
part 'user_model.g.dart';

/// [UserGender]
/// enum used to manage user gender
@HiveType(typeId: 2)
enum UserGender {
  @HiveField(0)
  male,

  @HiveField(1)
  female,
}

@HiveType(typeId: 1)
class User extends HiveObject implements BaseModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? phoneNumber;

  @HiveField(3)
  UserGender? gender;

  @HiveField(4)
  DateTime? joinedAt;

  @HiveField(5)
  bool? deletedUser;

  User({
    this.id,
    this.username,
    this.phoneNumber,
    this.gender,
    this.joinedAt,
    this.deletedUser,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phoneNumber": phoneNumber,
        "gender": gender == UserGender.male ? "male" : "female",
        "joinedAt": joinedAt,
        "deletedUser": deletedUser,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return User(
        id: json['id'] as String?,
        username: json['username'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        gender: json['gender'] == "male" ? UserGender.male : UserGender.female,
        joinedAt: DateTime.parse(json['joinedAt']),
        deletedUser: json['deletedUser'] as bool?,
      );
    } catch (e) {
      throw Exception("User mapping error");
    }
  }

  @override
  String toString() =>
  '{id: $id, username: $username, phoneNumber: $phoneNumber, gender: $gender, joinedAt: $joinedAt, deletedUser: $deletedUser}';
}
