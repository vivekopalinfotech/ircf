// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/model/user_response.dart';
import 'package:ircf/utils/preferences_data.dart';

class IrcfRepository {
  final Dio dio = Dio();
  var deviceToken;
  Future<String?> getDeviceToken() async {
    try {

      return await PreferenceData.getData('token');
    } catch (e) {}
    return null;
  }
  Future<CourseModuleResponse> courseModule() async {
    try {
      deviceToken = await getDeviceToken();
      final response = await dio.get(
        "https://cprinew.cprindia.in/api/course_module/14",
      );
      log(jsonEncode(response.data));
      return CourseModuleResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<CourseListingResponse> getCourse(String category) async {
    try {
      deviceToken = await getDeviceToken();
      final response = await dio.get(
        "https://cprinew.cprindia.in/api/course_listing/$category",
      );
      log(jsonEncode(response.data));
      return CourseListingResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AllListingResponse> allCourse() async {
    try {
      deviceToken = await getDeviceToken();
      final response = await dio.get(
        "https://cprinew.cprindia.in/api/all_course_listing",
      );
      log(jsonEncode(response.data));
      return AllListingResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<RegisterResponse> register(
      String ppl_name,
      String ppl_dob,
      String email,
      String mobile,
      String ppl_gender,
      ) async {


    FormData data = FormData();
   // if (fileName.isNotEmpty) {
      data = FormData.fromMap({
        "ppl_name": ppl_name,
        "ppl_dob": ppl_dob,
        "email": email,
        "mobile": mobile,
        "ppl_gender": ppl_gender,
      });
   // }
    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/regsiter_user",
        data: data
      );
        log(jsonEncode(response.data));
        return RegisterResponse.fromJson(response.data);

    } on DioError catch (e) {

      throw e.response!.data['message'];
    } catch (e) {
      //print(e);
      throw e.toString();
    }
  }


  Future<String> checkMobile(String mobile) async {
    FormData data = FormData();

    data = FormData.fromMap({
      "mobile": mobile,
    });
    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/check-user-mobile",
        data: data,
      );

      if(response.statusCode == 400){
        log(jsonEncode(response.data));
        return response.data['message'];
      }
      log(jsonEncode(response.data));
      return response.data['message'];

    } on DioError catch (e) {
      //print(e);
      throw e.response!.data['message'];
    } catch (e) {
      //print(e);
      throw e.toString();
    }
  }

  Future<UserResponse> login(String mobile, String password) async {

    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/user_login",
        data: {
          "mobile": mobile,
          "password":password
        },
      );
      log(jsonEncode(response.data));
      return UserResponse.fromJson(response.data);

    } on DioError catch (e) {
      //print(e);
      throw e.response!.data['message'];
    } catch (e) {
      //print(e);
      throw e.toString();
    }
  }


  Future<CourseCategoryResponse> courseCategory() async {
    try {
      deviceToken = await getDeviceToken();
      final response = await dio.get(
        "https://cprinew.cprindia.in/api/course_category",
      );
      log(jsonEncode(response.data));
      return CourseCategoryResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }
}
