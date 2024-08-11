import 'package:flutter/material.dart';

import 'pages/onboarding_page.dart';
import 'pages/splash_page.dart';
import 'services/pref_services.dart';
import 'utils/color_utility.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (BuildContext context) => const MyApp(),
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  PrefServices.init();
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
      // initialRoute: SplashPage.id,
      home: PrefServices.isOnBoardingSeen
          ? const OnboardingScreen()
          : const SplashPage(),
      // home: const SplashPage(),
    );
  }
}
