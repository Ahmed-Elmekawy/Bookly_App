import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/url_utils.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:flutter/material.dart';
import 'book_details_app_bar.dart';
import 'custom_book_details.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({required this.item, super.key});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookDetailsAppBar(item: item),
          const SizedBox(
            height: 30,
          ),
          CustomBookDetails(item: item),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 150,
                onPressed: () async {},
                text: item.saleInfo?.saleability == "NOT_FOR_SALE"
                    ? "NOT FOR SALE"
                    : "${item.saleInfo?.listPrice?.amount ?? ''} ${item.saleInfo?.listPrice?.currencyCode ?? ''}",
                topLeft: const Radius.circular(20),
                bottomLeft: const Radius.circular(20),
                color: AppColors.whiteColor,
              ),
              CustomButton(
                  width: 150,
                  onPressed: () async {
                    await UrlUtils.launchCustomUrl(
                        context, item.volumeInfo!.previewLink);
                  },
                  text: item.volumeInfo!.previewLink != null
                      ? "preview"
                      : "Not Available",
                  topRight: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                  color: AppColors.yellowColor),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20, left: 20),
            child: Text("You can also like",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30),
            child: SimilarBooksListView(),
          ),
        ],
      ),
    );
  }
}
