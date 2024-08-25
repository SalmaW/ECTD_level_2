import 'dart:ui';

import 'package:ectd2/day011/task/pages/preferences_service.dart';
import 'package:ectd2/day011/task/pages/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'day011/task/utils/color_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appMediaQueryW = MediaQuery.sizeOf(context).width;
    var appMediaQueryH = MediaQuery.sizeOf(context).height;
    if (kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      print('>>>>>> uesing web');
    }

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      print('>>>>>> uesing mobile');
    }

    if (defaultTargetPlatform == TargetPlatform.linux) {
      print('>>>>>> uesing linux');
    }
    return ScreenUtilInit(
      // Set the design size based on your design dimensions (width, height)
      designSize: Size(appMediaQueryW, appMediaQueryH),
      // Adapts text size across different devices
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehaviour(),
        theme: ThemeData(
          fontFamily: "PlusJakartaSans",
          scaffoldBackgroundColor: AppColors.scaffoldBg,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.main,
            secondary: AppColors.secondary,
          ),
          useMaterial3: true,
        ),
        title: 'Edu Vita',
        home: const SplashPage(),
      ),
    );
  }
}

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
