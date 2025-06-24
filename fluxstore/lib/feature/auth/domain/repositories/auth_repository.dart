import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signup(UserSignupEntity user);
  Future<Either<Failure, String>> login(UserLoginEntity user);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> verifyOTP(String email, String otp);
  Future<Either<Failure, String>> resetPassword(String email, String password);
}
