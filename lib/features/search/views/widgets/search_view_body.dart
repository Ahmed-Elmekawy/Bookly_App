import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/features/search/view_model/bloc/search_cubit.dart';
import 'package:bookly/features/search/view_model/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_field.dart';
import 'search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearchField(
                    formKey: formKey, searchController: searchController),
                const SizedBox(
                  height: 20,
                ),
                if (state is SearchLoading)
                  const LinearProgressIndicator(
                    color: AppColors.yellowColor,
                  ),
                if (state is SearchSuccess) const SearchListView(),
                if (state is SearchFailure)
                  Center(child: Text(state.errMessage)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
