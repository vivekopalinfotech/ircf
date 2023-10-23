import 'package:flutter/cupertino.dart';
import 'package:ircf/model/check_mobile_response.dart';



@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;

  RegisterSuccess(this.registerResponse);
}


class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}
