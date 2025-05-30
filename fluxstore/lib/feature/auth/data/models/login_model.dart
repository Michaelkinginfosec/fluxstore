import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';

class UserLoginRequestModel {
  final String email;
  final String password;

  UserLoginRequestModel({required this.email, required this.password});

  factory UserLoginRequestModel.fromEntity(UserLoginEntity entity) {
    return UserLoginRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
