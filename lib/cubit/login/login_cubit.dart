
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/login/login_state.dart';
import 'package:ircf/cubit/register/register_state.dart';
import 'package:ircf/model/user_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class LoginCubit extends Cubit<LoginState> {

  final IrcfRepository  _repository;

  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> login(
      String mobile,
      String password) async {
    try {
      emit(LoginLoading());

      UserResponse userResponse = await _repository.login(mobile,password);

      emit(LoginSuccess(userResponse));
      //  print(LoginResponse);
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}
