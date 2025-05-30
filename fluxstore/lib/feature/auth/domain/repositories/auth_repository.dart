import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';
import 'package:fluxstore/feature/auth/domain/entities/user_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signup(UserSignupEntity user);
  Future<UserEntity> login(String email, String password);
  Future<String> forgotPassword(String email);
  Future<String> verifyOTP(String email, String otp);
  Future<String> resetPassword(String email, String password);
}
