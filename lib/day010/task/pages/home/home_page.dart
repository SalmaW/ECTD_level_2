import 'package:flutter/material.dart';

import '../../../task/pages/home/widgets/desktop_widget.dart';
import '../../../task/pages/home/widgets/mobile_widget.dart';
import '../../widgets/app_builder_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
