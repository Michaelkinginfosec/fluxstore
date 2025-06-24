import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/exception.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/feature/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:fluxstore/feature/auth/data/models/login_model.dart';
import 'package:fluxstore/feature/auth/data/models/signup_request.dart';
import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final response = await authRemoteDatasource.forgotPassword(email);
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> login(UserLoginEntity user) async {
    try {
      final userLoginModel = UserLoginRequestModel(
        email: user.email,
        password: user.password,
      );

      final response = await authRemoteDatasource.login(userLoginModel);
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await authRemoteDatasource.resetPassword(
        email,
        password,
      );
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> signup(UserSignupEntity user) async {
    try {
      final userSignUpModel = UserSignupRequestModel(
        fullName: user.fullName,
        email: user.email,
        password: user.password,
      );

      final response = await authRemoteDatasource.signup(userSignUpModel);
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOTP(String email, String otp) async {
    try {
      final response = await authRemoteDatasource.verifyOTP(email, otp);
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
