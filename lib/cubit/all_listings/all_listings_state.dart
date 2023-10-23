
import 'package:flutter/cupertino.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';





@immutable
abstract class AllListingState{
}

class AllListingInitial extends AllListingState {}

class AllListingSuccess extends AllListingState {
  final AllListingResponse allListingResponse;
  AllListingSuccess(this.allListingResponse);

}


class AllListingLoading extends AllListingState {}
class AllListingError extends AllListingState {
  final String message;

  AllListingError(this.message);
}