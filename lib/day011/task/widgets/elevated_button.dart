import 'package:ectd2/day011/task/utils/color_utility.dart';
import 'package:flutter/material.dart';

class ElevatedButtonW extends StatelessWidget {
  final VoidCallback? onPressed;
  final Size? fixedSized;
  final Widget custom;

  const ElevatedButtonW(
      {required this.onPressed,
      super.key,
      this.fixedSized,
      required this.custom});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSized,
        shape: custom is Icon
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.secondary,
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: custom,
    );
  }
}
