
import 'package:flutter/cupertino.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';





@immutable
abstract class CourseListingState{
}

class CourseListingInitial extends CourseListingState {}

class CourseListingSuccess extends CourseListingState {
  final CourseListingResponse courseListingResponse;
  CourseListingSuccess(this.courseListingResponse);

}


class CourseListingLoading extends CourseListingState {}
class CourseListingError extends CourseListingState {
  final String message;

  CourseListingError(this.message);
}