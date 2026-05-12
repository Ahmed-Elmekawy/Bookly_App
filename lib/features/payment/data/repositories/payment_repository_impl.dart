import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource _paymentRemoteDataSource;

  PaymentRepositoryImpl(this._paymentRemoteDataSource);

  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await _paymentRemoteDataSource.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } on StripeException catch (e) {
      return Left(ServerFailure(e.error.message ?? 'Payment failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

