import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/errors/failure.dart';
import 'package:fluxstore/core/usecase/usecase.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase
    implements Usecase<Either<Failure, String>, ResetPasswordParams> {
  final AuthRepository authRepository;
  ResetPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call({
    required ResetPasswordParams param,
  }) async {
    return await authRepository.resetPassword(param.email, param.newPassword);
  }
}

class ResetPasswordParams {
  final String email;
  final String newPassword;

  ResetPasswordParams(this.email, this.newPassword);
}
