import 'package:flutter/cupertino.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/model/my_courses_response.dart';

import '../../model/course_category_response.dart';

@immutable
abstract class OngoingMyCoursesState {}

class OngoingMyCoursesInitial extends OngoingMyCoursesState {}

class OngoingMyCoursesSuccess extends OngoingMyCoursesState {
  final MyCoursesResponse myCoursesResponse;
  OngoingMyCoursesSuccess(this.myCoursesResponse);
}

class OngoingMyCoursesLoading extends OngoingMyCoursesState {}

class OngoingMyCoursesError extends OngoingMyCoursesState {
  final String message;

  OngoingMyCoursesError(this.message);
}
