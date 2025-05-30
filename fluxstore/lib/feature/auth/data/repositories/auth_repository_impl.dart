import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/exception.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/feature/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:fluxstore/feature/auth/data/models/signup_request.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';
import 'package:fluxstore/feature/auth/domain/entities/user_entities.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<String> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(String email, String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
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
      return Left(ServerFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<String> verifyOTP(String email, String otp) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
