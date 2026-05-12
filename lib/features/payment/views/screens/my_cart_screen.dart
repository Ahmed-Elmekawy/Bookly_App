import 'package:bookly/features/payment/views/widgets/my_cart_app_bar.dart';
import 'package:bookly/features/payment/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({
    super.key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.image,
    required this.currencyCode, required this.title,
  });
  final String title;
  final String image;
  final String currencyCode;
  final double price;
  final double discount;
  final double shipping;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCartAppBar(title: 'My Cart'),
      body: SafeArea(
        child: MyCartViewBody(
            price: price,
            discount: discount,
            shipping: shipping,
            image: image,
            currencyCode: currencyCode, title: title,),
      ),
    );
  }
}
