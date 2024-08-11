// import 'package:ectd2/day009/bloc/comment/comment_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// import 'day009/bloc/post/posts_bloc.dart';
// import 'day007/pages/onboarding_page.dart';
// import 'day007/pages/splash_page.dart';
// import 'day007/services/pref_services.dart';
// import 'day007/utils/color_utility.dart';
import 'day009/task/pages/home.dart';
import 'day009/task/provider/posts_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }

//3:30:00
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
