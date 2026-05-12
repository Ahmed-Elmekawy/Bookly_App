import 'package:bookly/core/utils/api_keys.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:bookly/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService _apiService;

  StripeService(this._apiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await _apiService.post(
      endPoint: 'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );

    return PaymentIntentModel.fromJson(response);
  }

  Future<void> initPaymentSheet(
      {required InitiPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Ahmed',
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiService.post(
      endPoint: 'https://api.stripe.com/v1/ephemeral_keys',
      data: {'customer': customerId},
      token: ApiKeys.secretKey,
      // The Stripe-Version header is required for ephemeral keys
    );

    return EphemeralKeyModel.fromJson(response);
  }
}
