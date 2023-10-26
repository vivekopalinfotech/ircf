
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/check_mobile/check_mobile_state.dart';
import 'package:ircf/cubit/next_module/next_module_state.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/model/next_module_model.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class NextModuleCubit extends Cubit<NextModuleState> {

  final IrcfRepository  _repository;

  NextModuleCubit(this._repository) : super(NextModuleInitial());

  Future<void> nextModule(String student_id, String module_id) async {
    try {
      emit(NextModuleLoading());

      NextModuleResponse nextModuleResponse = await _repository.nextModule(student_id, module_id);

      emit(NextModuleSuccess(nextModuleResponse));
      //  print(NextModuleResponse);
    } catch (e) {
      emit(NextModuleError(e.toString()));
    }
  }

}
