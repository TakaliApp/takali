// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      username: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      gender: fields[3] as UserGender?,
      joinedAt: fields[4] as DateTime?,
      deletedUser: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.joinedAt)
      ..writeByte(5)
      ..write(obj.deletedUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserGenderAdapter extends TypeAdapter<UserGender> {
  @override
  final int typeId = 2;

  @override
  UserGender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserGender.male;
      case 1:
        return UserGender.female;
      default:
        return UserGender.male;
    }
  }

  @override
  void write(BinaryWriter writer, UserGender obj) {
    switch (obj) {
      case UserGender.male:
        writer.writeByte(0);
        break;
      case UserGender.female:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
