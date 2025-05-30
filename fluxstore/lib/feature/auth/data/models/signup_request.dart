import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';

class UserSignupRequestModel {
  final String fullName;
  final String email;
  final String password;

  UserSignupRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory UserSignupRequestModel.fromEntity(UserSignupEntity entity) {
    return UserSignupRequestModel(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'password': password,
  };
}
