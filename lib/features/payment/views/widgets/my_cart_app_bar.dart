import 'package:flutter/material.dart';

class MyCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCartAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
