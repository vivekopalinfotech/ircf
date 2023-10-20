
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/check_mobile/check_mobile_state.dart';
import 'package:ircf/cubit/login/login_state.dart';
import 'package:ircf/model/check_mobile_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class MobileCubit extends Cubit<CheckMobileState> {

  final IrcfRepository  _repository;

  MobileCubit(this._repository) : super(CheckMobileInitial());

  Future<void> checkMobile(String mobile) async {
    try {
      emit(CheckMobileLoading());

      MobileResponse mobileResponse = await _repository.checkMobile(mobile);

      emit(CheckMobileSuccess(mobileResponse));
      //  print(CheckMobileResponse);
    } catch (e) {
      emit(CheckMobileError(e.toString()));
    }
  }

}
