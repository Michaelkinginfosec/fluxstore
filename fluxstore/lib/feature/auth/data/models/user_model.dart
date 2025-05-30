import 'package:fluxstore/feature/auth/domain/entities/user_entities.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String fullName;
  @HiveField(1)
  final String email;

  UserModel({required this.fullName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'fullName': fullName, 'email': email};
  }

  UserEntity toEntity() {
    return UserEntity(fullName: fullName, email: email);
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(fullName: entity.fullName, email: entity.email);
  }
}
