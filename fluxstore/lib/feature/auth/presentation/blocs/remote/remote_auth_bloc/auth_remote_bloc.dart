import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/feature/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_event.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_state.dart';

class AuthRemoteBloc extends Bloc<AuthRemoteEvent, AuthRemoteState> {
  final SignUpUsecase signUpUsecase;

  AuthRemoteBloc(this.signUpUsecase) : super(AuthRemoteInitial()) {
    on<SignupEventRequested>((event, emit) async {
      emit(AuthRemoteLoading());
      final result = await signUpUsecase(param: event.user);
      result.fold(
        (failure) => emit(AuthRemoteFailure(failure.toString())),
        (message) => emit(AuthRemoteSuccess(message)),
      );
    });
  }
}
