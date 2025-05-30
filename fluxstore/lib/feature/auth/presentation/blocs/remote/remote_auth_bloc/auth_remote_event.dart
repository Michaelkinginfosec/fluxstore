import 'package:flutter/material.dart';
import 'package:fluxstore/feature/auth/domain/entities/signup_request_entity.dart';

@immutable
sealed class AuthRemoteEvent {}

class SignupEventRequested extends AuthRemoteEvent {
  final UserSignupEntity user;
  SignupEventRequested(this.user);
}
