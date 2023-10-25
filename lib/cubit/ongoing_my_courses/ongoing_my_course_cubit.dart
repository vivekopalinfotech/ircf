import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/ongoing_my_courses/ongoing_my_courses_state.dart';
import 'package:ircf/model/my_courses_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class OngoingMyCoursesCubit extends Cubit<OngoingMyCoursesState> {

  final IrcfRepository  _repository;

  OngoingMyCoursesCubit(this._repository) : super(OngoingMyCoursesInitial());

  Future<void> ongoingMyCourses(String userId) async {
    try {
      emit(OngoingMyCoursesLoading());
      MyCoursesResponse myCoursesResponse = await _repository.ongoingMyCourses(userId);
      emit(OngoingMyCoursesSuccess(myCoursesResponse));
    } catch (e) {
      emit(OngoingMyCoursesError(e.toString()));
    }
  }

}
