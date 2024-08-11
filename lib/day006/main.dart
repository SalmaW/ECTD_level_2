import 'package:device_preview/device_preview.dart';
import 'package:ectd2/day006/utils/color_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
      home: const Home(),
    );
  }
}
