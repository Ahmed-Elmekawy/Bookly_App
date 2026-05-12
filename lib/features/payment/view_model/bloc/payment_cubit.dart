import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/repositories/payment_repository.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _paymentRepository;

  PaymentCubit(this._paymentRepository) : super(PaymentInitial());

  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var result = await _paymentRepository.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
      (failure) => emit(PaymentFailure(failure.message)),
      (_) => emit(PaymentSuccess()),
    );
  }
}
