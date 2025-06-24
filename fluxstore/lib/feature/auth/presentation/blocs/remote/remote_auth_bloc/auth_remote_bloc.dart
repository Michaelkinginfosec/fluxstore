import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/login_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_event.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_state.dart';

class AuthRemoteBloc extends Bloc<AuthRemoteEvent, AuthRemoteState> {
  final SignUpUsecase signUpUsecase;
  final LoginUsecase loginUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;

  AuthRemoteBloc(
    this.signUpUsecase,
    this.loginUsecase,
    this.forgotPasswordUsecase,
    this.verifyOtpUsecase,
    this.resetPasswordUsecase,
  ) : super(AuthRemoteInitial()) {
    on<SignupEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await signUpUsecase(param: event.user);
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.message)),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });
    on<LoginEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await loginUsecase(param: event.userLoginEntity);
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.message)),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });

    on<ForgotPasswordEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await forgotPasswordUsecase(param: event.email);
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.message)),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });

    on<VerifyOtpEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await verifyOtpUsecase(
        param: VerifyOtpParams(event.email, event.otp),
      );
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.message)),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });

    on<ResetPasswordEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await resetPasswordUsecase(
        param: ResetPasswordParams(event.email, event.password),
      );
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.message)),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });
  }
}
