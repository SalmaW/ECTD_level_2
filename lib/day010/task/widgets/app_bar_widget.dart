import 'package:ectd2/day010/task/utils/app_screenutil.dart';
import 'package:ectd2/day010/task/widgets/icon_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppScreenUtil.smallPadding),
      child: Row(
        children: [
          Text(
            'Salma Maarouf',
            style: GoogleFonts.acme(
              fontSize: kIsWeb
                  ? AppScreenUtil.appBarLargeTextW
                  : AppScreenUtil.appBarLargeTextM,
            ),
          ),
          Expanded(
            child: Text(
              '    Flutter Developer',
              style: GoogleFonts.acme(
                fontStyle: FontStyle.italic,
                fontSize: kIsWeb
                    ? AppScreenUtil.appBarMediumTextW
                    : AppScreenUtil.appBarMediumTextM,
              ),
            ),
          ),
          IconLinks(
              iconSize: kIsWeb
                  ? AppScreenUtil.webDefault
                  : AppScreenUtil.mobileDefault),
        ],
      ),
    );
  }
}
