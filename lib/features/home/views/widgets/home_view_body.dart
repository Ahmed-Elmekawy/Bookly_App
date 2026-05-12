import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'home_app_bar.dart';
import 'newest_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const NewestBooksListView(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Best Seller",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10, left: 20, bottom: 20),
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}
