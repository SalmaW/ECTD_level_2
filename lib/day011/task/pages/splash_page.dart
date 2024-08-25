import 'package:ectd2/day011/task/pages/home.dart';
import 'package:ectd2/day011/task/pages/on_boarding.dart';
import 'package:ectd2/day011/task/pages/preferences_service.dart';
import 'package:ectd2/day011/task/utils/images_utility.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String id = "SplashPage";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _onStart();
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
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  void _onStart() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      if (PreferencesService.isOnboardingSeen) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoarding()));
      }
    }
  }
}
