import 'package:bookly/features/payment/views/widgets/my_cart_app_bar.dart';
import 'package:bookly/features/payment/views/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCartAppBar(),
      body: ThankYouViewBody(total: total),
    );
  }
}
