
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/login/login_state.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class LoginCubit extends Cubit<LoginState> {

  final IrcfRepository  _repository;

  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> register( String name,
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
      String ppl_tag,) async {
    try {
      emit(LoginLoading());

      String message = await _repository.register(name,ppl_name,ppl_dob,email,mobile,ppl_gender,
      password,ppl_met_on,ppl_title_id,ppl_city,ppl_address,ppl_remark,ppl_tag);

      emit(LoginSuccess(message));
      //  print(LoginResponse);
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}
