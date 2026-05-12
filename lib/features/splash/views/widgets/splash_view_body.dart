import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_navigation.dart';
import 'package:bookly/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    logoAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Image(
                image: const AssetImage(AppAssets.logo),
                width: sizeAnimation.value,
                color: colorAnimation.value,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "browse paid books",
            style: TextStyle(
                color: const Color(0xffA7A2A9).withValues(alpha: 0.25),
                fontSize: 18,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  void logoAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    colorAnimation =
        ColorTween(begin: AppColors.greyColor.withValues(alpha: 0.25), end: AppColors.yellowColor)
            .animate(animationController);
    sizeAnimation =
        Tween<double>(begin: 200.0, end: 300.0).animate(animationController);
    animationController.forward();
  }

  Future<void> navigateToHome() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          AppNavigation.navigateToHome(context);
        }
      },
    );
  }
}
