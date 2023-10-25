import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/course_module/course_module_state.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class CourseModuleCubit extends  Cubit<CourseModuleState>{

  final IrcfRepository  _repository;

  CourseModuleCubit(this._repository) : super(CourseModuleInitial());


  Future<void> courseModule(String id) async {
    try {


      CourseModuleResponse courseModuleResponse = await _repository.courseModule(id);

      emit(CourseModuleSuccess(courseModuleResponse));

      //     print(CourseModuleResponse);
    }catch(e){
      emit(CourseModuleError(e.toString()));
    }
  }

}