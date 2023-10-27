import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/update_my_courses/update_my_courses_state.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/model/my_courses_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class UpdateMyCoursesCubit extends Cubit<UpdateMyCoursesState> {

  final IrcfRepository  _repository;

  UpdateMyCoursesCubit(this._repository) : super(UpdateMyCoursesInitial());

  Future<void> updateMyCourses(String id, String studentId) async {
    try {
      emit(UpdateMyCoursesLoading());
      CourseModuleResponse courseModuleResponse = await _repository.updateMyCourses(id,studentId);
      emit(UpdateMyCoursesSuccess(courseModuleResponse));
    } catch (e) {
      emit(UpdateMyCoursesError(e.toString()));
    }
  }

}
