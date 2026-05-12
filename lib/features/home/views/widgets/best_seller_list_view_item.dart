import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_navigation.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:flutter/material.dart';

class BestListViewItem extends StatelessWidget {
  const BestListViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.authors,
    required this.averageRating,
    required this.ratingsCount,
    required this.item,
    required this.category,
  });

  final String imageUrl;
  final String title;
  final List<String> authors;
  final dynamic averageRating;
  final int ratingsCount;
  final Items item;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.navigateToBookDetails(context,
            item: item, category: category);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            bookImage(
              url: imageUrl,
              height: 125,
              width: 80,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    authors.isNotEmpty ? authors[0] : 'Unknown Author',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 6.3,
                      ),
                      Text(
                        averageRating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '($ratingsCount)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
