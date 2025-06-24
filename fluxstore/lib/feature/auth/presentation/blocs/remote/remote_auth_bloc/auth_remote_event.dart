import 'package:flutter/material.dart';
import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';

@immutable
sealed class AuthRemoteEvent {}

class SignupEventRequested extends AuthRemoteEvent {
  final UserSignupEntity user;
  SignupEventRequested(this.user);
}

class LoginEventRequested extends AuthRemoteEvent {
  final UserLoginEntity userLoginEntity;

  LoginEventRequested(this.userLoginEntity);
}

class ForgotPasswordEventRequested extends AuthRemoteEvent {
  final String email;
  ForgotPasswordEventRequested(this.email);
}

class VerifyOtpEventRequested extends AuthRemoteEvent {
  final String email;
  final String otp;

  VerifyOtpEventRequested(this.email, this.otp);
}

class ResetPasswordEventRequested extends AuthRemoteEvent {
  final String email;
  final String password;

  ResetPasswordEventRequested(this.email, this.password);
}
