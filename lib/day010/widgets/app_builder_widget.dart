import 'package:flutter/material.dart';

class AppBuilderWidget extends StatelessWidget {
  final Widget Function(BuildContext) desktop;
  final Widget Function(BuildContext) tablet;
  final Widget Function(BuildContext) mobile;
  const AppBuilderWidget(
      {required this.desktop,
      required this.tablet,
      required this.mobile,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < 600) {
      return mobile.call(context);
    } else if (MediaQuery.sizeOf(context).width < 1100) {
      return tablet.call(context);
    }

    return desktop.call(context);
  }
}
