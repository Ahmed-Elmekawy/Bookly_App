import 'package:bookly/core/utils/app_navigation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/book_model.dart';

ClipRRect bookImage(
    {context,
    required String url,
    required double height,
    required double width,
    Items? item,
    String? category}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          if (item != null && category != null) {
            AppNavigation.navigateToBookDetails(context,
                item: item, category: category);
          }
        },
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    ),
  );
}
