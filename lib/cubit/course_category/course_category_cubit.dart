import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/course_category/course_category_state.dart';
import 'package:ircf/model/course_category_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class CourseCategoryCubit extends  Cubit<CourseCategoryState>{

  final IrcfRepository  _repository;

  CourseCategoryCubit(this._repository) : super(CourseCategoryInitial());


  Future<void> courseCategory() async {
    try {


      CourseCategoryResponse categoryResponse = await _repository.courseCategory();

      emit(CourseCategorySuccess(categoryResponse));

      //     print(CourseCategoryResponse);
    }catch(e){
      emit(CourseCategoryError(e.toString()));
    }
  }

}