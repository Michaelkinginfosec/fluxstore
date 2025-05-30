import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/core/usecase/usecase.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase
    implements Usecase<Either<Failure, String>, UserSignupEntity> {
  final AuthRepository authRepository;
  SignUpUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call({required UserSignupEntity param}) {
    return authRepository.signup(param);
  }
}
