import 'package:fluxstore/core/constants/app_constants.dart';
import 'package:fluxstore/core/network/dio_client.dart';
import 'package:fluxstore/feature/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:fluxstore/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fluxstore/feature/auth/domain/repositories/auth_repository.dart';
import 'package:fluxstore/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/login_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fluxstore/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> dependency() async {
  //dio client
  sl.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: AppConstants.baseUrl),
  );

  //auth remote datasource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(dio: sl<DioClient>().dio),
  );

  //auth repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: sl<AuthRemoteDatasource>()),
  );

  //usecase
  sl.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<ForgotPasswordUsecase>(
    () => ForgotPasswordUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<VerifyOtpUsecase>(
    () => VerifyOtpUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResetPasswordUsecase>(
    () => ResetPasswordUsecase(sl<AuthRepository>()),
  );

  //blocs
  sl.registerFactory<AuthRemoteBloc>(
    () => AuthRemoteBloc(
      sl<SignUpUsecase>(),
      sl<LoginUsecase>(),
      sl<ForgotPasswordUsecase>(),
      sl<VerifyOtpUsecase>(),
      sl<ResetPasswordUsecase>(),
    ),
  );
}
