import 'package:flutter/cupertino.dart';



@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String msg;

  LoginSuccess(this.msg);
}

class ResendLoginSuccess extends LoginState {
  final String LoginResponse;

  ResendLoginSuccess(this.LoginResponse);

}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
