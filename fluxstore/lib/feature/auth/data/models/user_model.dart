import 'package:fluxstore/feature/auth/domain/entities/user_entities.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String createdAt;
  @HiveField(4)
  final String updatedAt;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fullName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      email: email,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class UserData extends HiveObject {
  @HiveField(0)
  final UserModel user;
  @HiveField(1)
  final String token;

  UserData({required this.user, required this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: json['user'] ?? {},
      token: json['access_token'] ?? '',
    );
  }

  UserDataEntity toEntity() {
    return UserDataEntity(user: user.toEntity(), token: token);
  }
}
