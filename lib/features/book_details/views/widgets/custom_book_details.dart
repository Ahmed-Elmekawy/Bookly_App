import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:flutter/material.dart';

class CustomBookDetails extends StatelessWidget {
  const CustomBookDetails({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bookImage(
            height: 243,
            width: 162,
            url: item.volumeInfo?.imageLinks?.thumbnail ?? ''),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.volumeInfo?.title ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        if (item.volumeInfo?.authors != null)
          for (String author in item.volumeInfo!.authors!)
            Text(
              author,
              style: Theme.of(context).textTheme.titleMedium,
            ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: AppColors.yellowColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${item.volumeInfo?.averageRating ?? 0}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "(${item.volumeInfo?.ratingsCount ?? 0})",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ],
    );
  }
}
