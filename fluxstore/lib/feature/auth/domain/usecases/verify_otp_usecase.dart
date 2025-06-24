import 'package:dartz/dartz.dart';
import 'package:fluxstore/core/usecase/usecase.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';

import '../../../../core/errors/failure.dart';

class VerifyOtpUsecase
    implements Usecase<Either<Failure, String>, VerifyOtpParams> {
  final AuthRepository authRepository;

  VerifyOtpUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call({required VerifyOtpParams param}) async {
    return await authRepository.verifyOTP(param.email, param.otp);
  }
}

class VerifyOtpParams {
  final String email;
  final String otp;

  VerifyOtpParams(this.email, this.otp);
}
