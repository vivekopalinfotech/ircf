import 'package:flutter/cupertino.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_module_response.dart';

import '../../model/course_category_response.dart';





@immutable
abstract class CourseCategoryState{
}

class CourseCategoryInitial extends CourseCategoryState {}

class CourseCategorySuccess extends CourseCategoryState {
  final CourseCategoryResponse categoryResponse;
  CourseCategorySuccess(this.categoryResponse);

}


class CourseCategoryLoading extends CourseCategoryState {}
class CourseCategoryError extends CourseCategoryState {
  final String message;

  CourseCategoryError(this.message);
}