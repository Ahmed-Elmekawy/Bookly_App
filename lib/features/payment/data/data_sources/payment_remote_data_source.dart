import 'package:bookly/core/utils/stripe_service.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';

abstract class PaymentRemoteDataSource {
  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final StripeService _stripeService;

  PaymentRemoteDataSourceImpl(this._stripeService);

  @override
  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    await _stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
}
