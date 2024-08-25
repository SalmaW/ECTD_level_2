import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';

import '../utils/color_utility.dart';
import '../utils/my_icons.dart';

class AltSignInRow extends StatelessWidget {
  const AltSignInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                MyIcons.linkedIn,
                color: AppColors.linkedin,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                MyIcons.gitHub,
                color: AppColors.github,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.facebook_rounded,
                size: 28,
                color: AppColors.facebook,
              )),
          AnyLogo.tech.google.image(scale: 20),
        ],
      ),
    );
  }
}
