import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/url_utils.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/features/home/view_model/bloc/home_cubit.dart';
import 'package:bookly/features/home/view_model/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          var items = state.homeModel.items!;
          return SizedBox(
            height: 225,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          bookImage(
                              context: context,
                              url: items[index]
                                  .volumeInfo!
                                  .imageLinks!
                                  .thumbnail!,
                              height: 225,
                              width: 150,
                              item: items[index],
                              category:
                                  items[index].volumeInfo!.categories![0]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: IconButton(
                                onPressed: () async {
                                  await UrlUtils.launchCustomUrl(context,
                                      items[index].volumeInfo!.previewLink);
                                },
                                icon: const Icon(
                                  Icons.play_circle,
                                  size: 40,
                                  color: AppColors.yellowColor,
                                )),
                          )
                        ],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: items.length),
            ),
          );
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.yellowColor),
          );
        }
      },
    );
  }
}
