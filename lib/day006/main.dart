import 'package:flutter/material.dart';

import '../day006/pages/onboarding_page.dart';
import '../day006/utils/color_utility.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (BuildContext context) => const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
        scaffoldBackgroundColor: ColorUtility.scaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorUtility.main,
          secondary: ColorUtility.secondary,
        ),
        useMaterial3: true,
      ),
      home: const OnBoardingPage(),
    );
  }
}
