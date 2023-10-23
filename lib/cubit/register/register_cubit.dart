
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/register/register_state.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class RegisterCubit extends Cubit<RegisterState> {

  final IrcfRepository  _repository;

  RegisterCubit(this._repository) : super(RegisterInitial());

  Future<void> register(
      String ppl_name,
      String ppl_dob,
      String email,
      String mobile,
      String ppl_gender,
     ) async {
    try {
      emit(RegisterLoading());

      RegisterResponse registerResponse = await _repository.register(ppl_name,ppl_dob,email,mobile,ppl_gender);

      emit(RegisterSuccess(registerResponse));
      //  print(RegisterResponse);
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

}
