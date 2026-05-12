import 'package:bookly/features/book_details/view_model/bloc/similar_books_cubit.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_details_view_body.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    super.key,
    required this.item,
    required this.category,
  });

  final Items item;
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<SimilarBooksCubit>()..fetchSimilarBooks(category: category),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(
            item: item,
          ),
        ),
      ),
    );
  }
}
