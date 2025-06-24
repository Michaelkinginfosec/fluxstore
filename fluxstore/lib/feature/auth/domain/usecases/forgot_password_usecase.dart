import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/core/usecase/usecase.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase
    implements Usecase<Either<Failure, String>, String> {
  final AuthRepository authRepository;
  ForgotPasswordUsecase(this.authRepository);
  @override
  Future<Either<Failure, String>> call({required String param}) {
    return authRepository.forgotPassword(param);
  }
}
