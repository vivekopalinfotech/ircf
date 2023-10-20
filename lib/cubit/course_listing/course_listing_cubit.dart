import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/course_listing/course_listing_state.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class CourseListingCubit extends  Cubit<CourseListingState>{

  final IrcfRepository  _repository;

  CourseListingCubit(this._repository) : super(CourseListingInitial());


  Future<void> courseListing(String category) async {
    try {


      CourseListingResponse courseListingResponse = await _repository.getCourse(category);

      emit(CourseListingSuccess(courseListingResponse));

      //     print(CourseListingResponse);
    }catch(e){
      emit(CourseListingError(e.toString()));
    }
  }

}