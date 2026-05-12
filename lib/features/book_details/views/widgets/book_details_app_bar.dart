import 'package:bookly/core/utils/app_navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key, required this.item});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                AppNavigation.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.yellow,
                size: 32,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {
                AppNavigation.navigateToMyCart(context,
                    price: item.saleInfo?.listPrice?.amount ?? 0,
                    discount: 0,
                    shipping: 50,
                    title: item.volumeInfo?.title ?? '',
                    image: item.volumeInfo?.imageLinks?.thumbnail ?? '',
                    currencyCode: item.saleInfo?.listPrice?.currencyCode ?? '');
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.yellow,
                size: 25,
              ))
        ],
      ),
    );
  }
}

