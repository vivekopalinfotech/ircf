// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:ircf/model/my_courses_response.dart';
import 'package:ircf/model/next_module_model.dart';
import 'package:ircf/model/user_response.dart';



@immutable
abstract class UpdateMyCoursesState {}

class UpdateMyCoursesInitial extends UpdateMyCoursesState {}

class UpdateMyCoursesSuccess extends UpdateMyCoursesState {
  final  MyCoursesResponse updateMyCoursesResponse;

  UpdateMyCoursesSuccess(this.updateMyCoursesResponse);
}


class UpdateMyCoursesLoading extends UpdateMyCoursesState {}

class UpdateMyCoursesError extends UpdateMyCoursesState {
  final String message;

  UpdateMyCoursesError(this.message);
}
