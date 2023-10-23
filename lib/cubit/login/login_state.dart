// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:ircf/model/user_response.dart';



@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final UserResponse userResponse;

  LoginSuccess(this.userResponse);
}


class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
