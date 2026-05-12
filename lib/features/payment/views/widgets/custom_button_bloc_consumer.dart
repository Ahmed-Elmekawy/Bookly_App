import 'dart:developer';
import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/api_keys.dart';
import 'package:bookly/core/utils/app_navigation.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/models/paypal/input_paybal_model.dart';
import 'package:bookly/features/payment/view_model/bloc/payment_cubit.dart';
import 'package:bookly/features/payment/view_model/bloc/payment_state.dart';
import 'package:bookly/features/payment/views/screens/thank_you_screen.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../core/utils/ui_utils.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
    required this.total,
  });
  final double total;
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          AppNavigation.navigateTo(context,
              widget: ThankYouScreen(total: total));
        } else if (state is PaymentFailure) {
          AppNavigation.pop(context);
          UiUtils.showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) => CustomButton(
        color: AppColors.yellowColor,
        onPressed: () {
          if (state is! PaymentLoading) {
            isPaypal ? paypalPayment(context) : stripePayment(context);
          }
        },
        text: state is PaymentLoading ? "Loading..." : "Continue",
        width: double.infinity,
      ),
    );
  }

  void paypalPayment(BuildContext context) {
    ItemModelInput itemModelInput =
        ItemModelInput(price: "${total.ceil()}", currency: "USD");
    List<ItemModelInput> items = [itemModelInput];
    InputPaypalModel inputPaypalModel = InputPaypalModel(
        total: "${total.ceil()}", currency: "USD", items: items);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [inputPaypalModel.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          AppNavigation.navigateTo(context,
              widget: ThankYouScreen(total: total));
        },
        onError: (error) {
          log("onError: $error");
          AppNavigation.pop(context);
        },
        onCancel: () {
          AppNavigation.pop(context);
        },
      ),
    ));
  }

  void stripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
        customerId: "cus_PkxH0x4HgNOo6p",
        amount: "${total.ceil()}",
        currency: "EGP");
    context
        .read<PaymentCubit>()
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
}
