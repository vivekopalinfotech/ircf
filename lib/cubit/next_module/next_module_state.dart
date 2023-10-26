// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:ircf/model/next_module_model.dart';
import 'package:ircf/model/user_response.dart';



@immutable
abstract class NextModuleState {}

class NextModuleInitial extends NextModuleState {}

class NextModuleSuccess extends NextModuleState {
  final  NextModuleResponse nextModuleResponse;

  NextModuleSuccess(this.nextModuleResponse);
}


class NextModuleLoading extends NextModuleState {}

class NextModuleError extends NextModuleState {
  final String message;

  NextModuleError(this.message);
}
