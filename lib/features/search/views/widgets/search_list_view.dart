import 'package:bookly/features/search/view_model/bloc/search_cubit.dart';
import 'package:bookly/features/search/view_model/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          var items = state.homeModel.items;
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SearchListViewItem(
                    imageUrl:
                        items[index].volumeInfo!.imageLinks?.thumbnail ?? '',
                    title: items[index].volumeInfo!.title!,
                    authors: items[index].volumeInfo!.authors ?? [],
                    averageRating: items[index].volumeInfo!.averageRating ?? 0,
                    ratingsCount: items[index].volumeInfo!.ratingsCount ?? 0,
                    item: items[index],
                    category:
                        items[index].volumeInfo!.categories?[0] ?? 'General',
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: items!.length);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
