import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'day010/task/pages/home/home_page.dart';

void main() {
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
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            scrollBehavior: AppScrollBehaviour(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              fontFamily: GoogleFonts.acme().fontFamily,
              useMaterial3: true,
            ),
            home: const MyHomePage(),
          );
        });
  }
}

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// void main() {
//   // runApp(DevicePreview(
//   //   enabled: !kReleaseMode,
//   //   builder: (BuildContext context) => const MyApp(),
//   // ));
//   WidgetsFlutterBinding.ensureInitialized();
//   PrefServices.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // useInheritedMediaQuery: true,
//       // locale: DevicePreview.locale(context),
//       // builder: DevicePreview.appBuilder,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: "PlusJakartaSans",
//         scaffoldBackgroundColor: ColorUtility.scaffoldBackground,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: ColorUtility.main,
//           secondary: ColorUtility.secondary,
//         ),
//         useMaterial3: true,
//       ),
//       // initialRoute: SplashPage.id,
//       home: PrefServices.isOnBoardingSeen
//           ? const OnboardingScreen()
//           : const SplashPage(),
//       // home: const SplashPage(),
//     );
//   }
// }
