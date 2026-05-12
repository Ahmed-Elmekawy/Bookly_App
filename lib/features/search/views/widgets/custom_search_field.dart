import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/features/search/view_model/bloc/search_cubit.dart';
import 'package:bookly/features/search/view_model/bloc/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.formKey,
    required this.searchController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              context.read<SearchCubit>().searchBooks(category: value);
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter name of book";
            }
            return null;
          },
          keyboardType: TextInputType.name,
          controller: searchController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.greyColor)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.yellowColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: "Search",
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColors.greyColor,
                size: 18,
              )),
          cursorColor: AppColors.yellowColor,
        );
      },
    );
  }
}

