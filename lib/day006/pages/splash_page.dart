import 'package:ectd2/day006/utils/images_utility.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Image.asset(
                  ImageUtility.logoText,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 70,
                child: Image.asset(
                  scale: 3.5,
                  ImageUtility.logoIcon,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
