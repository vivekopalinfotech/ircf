import 'package:flutter/cupertino.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_module_response.dart';

import '../../model/course_category_response.dart';





@immutable
abstract class CheckMobileState{
}

class CheckMobileInitial extends CheckMobileState {}

class CheckMobileSuccess extends CheckMobileState {
  final MobileResponse mobileResponse;
  CheckMobileSuccess(this.mobileResponse);

}


class CheckMobileLoading extends CheckMobileState {}
class CheckMobileError extends CheckMobileState {
  final String message;

  CheckMobileError(this.message);
}