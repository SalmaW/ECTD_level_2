import 'package:flutter/material.dart';

import '../utils/color_utility.dart';

class UnderscoreSeparator extends StatelessWidget {
  const UnderscoreSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Divider(
      thickness: 1.5,
      color: AppColors.lightGrey,
    ));
  }
}
