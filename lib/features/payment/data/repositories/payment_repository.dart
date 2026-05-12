import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import '../models/payment_intent_input_model.dart';

abstract class PaymentRepository {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}
