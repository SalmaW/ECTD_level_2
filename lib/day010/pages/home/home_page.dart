import 'package:flutter/material.dart';

import '../../../day010/pages/home/widgets/desktop_widget.dart';
import '../../../day010/pages/home/widgets/mobile_widget.dart';
import '../../widgets/app_builder_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBuilderWidget(
            desktop: (ctx) => const DesktopWidget(),
            tablet: (ctx) => const DesktopWidget(),
            mobile: (ctx) => const MobileWidget()));
  }
}
