import 'package:flutter/material.dart';

import '../../utils/color_utility.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: ColorUtility.grey,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
