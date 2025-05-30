import 'package:flutter/material.dart';

@immutable
sealed class AuthRemoteState {}

class AuthRemoteInitial extends AuthRemoteState {}

class AuthRemoteLoading extends AuthRemoteState {}

class AuthRemoteSuccess extends AuthRemoteState {
  final String message;
  AuthRemoteSuccess(this.message);
}

class AuthRemoteFailure extends AuthRemoteState {
  final String error;
  AuthRemoteFailure(this.error);
}
