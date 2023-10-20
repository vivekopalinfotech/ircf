import 'dart:convert';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';

class IrcfRepository {
  final Dio dio = Dio();

  Future<CourseModuleResponse> courseModule() async {
    try {
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

  Future<String> register(
      String name,
      String ppl_name,
      String ppl_dob,
      String email,
      String mobile,
      String ppl_gender,
      String password,
      String ppl_met_on,
      String ppl_title_id,
      String ppl_city,
      String ppl_address,
      String ppl_remark,
      String ppl_tag,
      ) async {


    // String fileName = "";
    // if (image != null) {
    //   fileName = image.path.split('/').last;
    // }
    FormData data = FormData();
   // if (fileName.isNotEmpty) {
      data = FormData.fromMap({
        "name": name,
        "ppl_name": ppl_name,
        "ppl_dob": ppl_dob,
        "email": email,
        "mobile": mobile,
        "ppl_gender": ppl_gender,
        "password": password,
        "ppl_met_on": ppl_met_on,
        "ppl_title_id": ppl_title_id,
        "ppl_city": ppl_city,
        "ppl_address": ppl_address,
        "ppl_remark": ppl_remark,
        "ppl_tag": ppl_tag,
      });
   // }
    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/regsiter_user",
        data: data
      );
      if (response.data["status"] == true) {
        log(jsonEncode(response.data));
        return response.data;
      } else {
        return 'error';
      }
    } on DioError catch (e) {

      throw e.response!.data['message'];
    } catch (e) {
      //print(e);
      throw e.toString();
    }
  }


  Future<MobileResponse> checkMobile(String mobile) async {
    FormData data = FormData();

    data = FormData.fromMap({
      "mobile": mobile,
    });
    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/check-user-mobile",
        data: data,
      );
      log(jsonEncode(response.data));
        return MobileResponse.fromJson(response.data);

    } on DioError catch (e) {
      //print(e);
      throw e.response!.data['message'];
    } catch (e) {
      //print(e);
      throw e.toString();
    }
  }

  Future<String> login(String mobile) async {

    try {
      final response = await dio.post(
        "https://cprinew.cprindia.in/api/check-user-mobile",
        data: {"mobile": mobile},
      );
      log(jsonEncode(response.data));
      return response.data;

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
