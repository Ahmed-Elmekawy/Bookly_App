import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_navigation.dart';
import 'package:bookly/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          const Image(
            image: AssetImage(AppAssets.logo),
            height: 16,
            color: AppColors.yellowColor,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                AppNavigation.navigateToSearch(context);
              },
              icon: const Icon(CupertinoIcons.search,
                  color: AppColors.yellowColor, size: 25))
        ],
      ),
    );
  }
}

