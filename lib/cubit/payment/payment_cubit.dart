
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/payment/payment_state.dart';

import 'package:ircf/service/repo/ircf_repository.dart';


class PaymentCubit extends Cubit<PaymentState> {

  final IrcfRepository  _repository;

  PaymentCubit(this._repository) : super(PaymentInitial());

  Future<void> payment(String std_ppl_id,String csr_id,) async {
    try {
      emit(PaymentLoading());

      String msg = await _repository.payment(std_ppl_id,csr_id,);

      emit(PaymentSuccess(msg));
      //  print(PaymentResponse);
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

}
