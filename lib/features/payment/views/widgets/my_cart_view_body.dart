import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/order_info_item.dart';
import 'package:bookly/features/payment/view_model/bloc/payment_cubit.dart';
import 'package:bookly/features/payment/views/widgets/payment_method_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/di/injection_container.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.image,
      required this.currencyCode,
      required this.title});
  final String title;
  final String image;
  final double price;
  final double discount;
  final double shipping;
  final String currencyCode;
  @override
  Widget build(BuildContext context) {
    final double total = price.ceil() + shipping;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          bookImage(
            url: image,
            height: 243,
            width: 162,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: "$price $currencyCode",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Discount',
            value: "$discount $currencyCode",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Shipping',
            value: "$shipping $currencyCode",
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          OrderInfoItem(title: 'Total', value: "$total $currencyCode"),
          const SizedBox(
            height: 16,
          ),
          const Spacer(),
          CustomButton(
            width: double.infinity,
            bottomRight: const Radius.circular(15),
            bottomLeft: const Radius.circular(15),
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            text: 'Complete Payment',
            color: AppColors.yellowColor,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                        create: (context) => sl<PaymentCubit>(),
                        child: PaymentMethodsBottomSheet(total: total));
                  });
            },
          ),
        ],
      ),
    );
  }
}
