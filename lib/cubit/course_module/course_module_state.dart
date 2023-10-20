import 'package:flutter/cupertino.dart';
import 'package:ircf/model/course_module_response.dart';





@immutable
abstract class CourseModuleState{
}

class CourseModuleInitial extends CourseModuleState {}

class CourseModuleSuccess extends CourseModuleState {
  final CourseModuleResponse courseModuleResponse;
  CourseModuleSuccess(this.courseModuleResponse);

}


class CourseModuleLoading extends CourseModuleState {}
class CourseModuleError extends CourseModuleState {
  final String message;

  CourseModuleError(this.message);
}