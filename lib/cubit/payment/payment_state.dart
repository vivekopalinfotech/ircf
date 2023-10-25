import 'package:flutter/cupertino.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_module_response.dart';

import '../../model/course_category_response.dart';





@immutable
abstract class PaymentState{
}

class PaymentInitial extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String msg;
  PaymentSuccess(this.msg);

}


class PaymentLoading extends PaymentState {}
class PaymentError extends PaymentState {
  final String message;

  PaymentError(this.message);
}