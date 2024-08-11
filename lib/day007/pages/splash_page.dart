import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/onboarding_page.dart';
import '../services/pref_services.dart';
import '../utils/images_utility.dart';

class SplashPage extends StatefulWidget {
  static String id = "SplashPage";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _startApp();
    super.initState();
  }

  void _startApp() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      if (PrefServices.isOnBoardingSeen) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      }
    }
  }

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
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
