import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/book_model.dart';

class AppNavigation {
  static void navigateToHome(BuildContext context) {
    context.go(AppRouter.kHomeView);
  }

  static void navigateToBookDetails(BuildContext context,
      {required Items item, required String category}) {
    context.push(
      AppRouter.kBookDetailsView,
      extra: {
        'item': item,
        'category': category,
      },
    );
  }

  static void navigateToSearch(BuildContext context) {
    context.push(AppRouter.kSearchView);
  }

  static void navigateToMyCart(BuildContext context,
      {required double price,
      required double discount,
      required double shipping,
      required String title,
      required String image,
      required String currencyCode}) {
    context.push(
      AppRouter.kMyCartView,
      extra: {
        'price': price,
        'discount': discount,
        'shipping': shipping,
        'title': title,
        'image': image,
        'currencyCode': currencyCode,
      },
    );
  }

  static void navigateTo(BuildContext context, {required Widget widget}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
