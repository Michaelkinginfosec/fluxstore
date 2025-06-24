import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/core/usecase/usecase.dart';
import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class LoginUsecase
    implements Usecase<Either<Failure, String>, UserLoginEntity> {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call({required UserLoginEntity param}) {
    return authRepository.login(param);
  }
}
