import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenUtil {
  // app Height & Width
  static double appWidth = ScreenUtil().screenWidth;
  static double appHeight = ScreenUtil().screenHeight;

  // Heights
  static double smallHeight = 20.h;
  static double mediumHeight = 50.h;
  static double largeHeight = 150.h;
  static double wrapSpacingHeight = 10.h;

  // Widths
  static double smallWidth = 20.w;
  static double mediumWidth = 50.w;
  static double largeWidth = 150.w;
  static double appDrawerW = 240.w;
  static double wrapSpacingWidth = 10.h;

  //padding
  static EdgeInsetsGeometry authPadding =
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 37.0);
  static EdgeInsetsGeometry authPaddingV =
      const EdgeInsets.symmetric(vertical: 10.0);
  static EdgeInsetsGeometry authPaddingH =
      const EdgeInsets.symmetric(horizontal: 37.0);

  // Font Sizes
  static double loginTitle = 32.sp;

  // Icon Sizes
  static double webDefault = 24.sp;
  static double mobileDefault = 22.sp;

  // Padding & Margins
  static double smallPadding = 10.w;
  static double mediumPadding = 16.w;
  static double largePadding = 24.w;
}
