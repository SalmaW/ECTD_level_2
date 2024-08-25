import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_utility.dart';

class TextFieldW extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final bool? obscure;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldW({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.hintText,
    this.obscure,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
      obscureText: obscure ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType ?? TextInputType.text,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(color: AppColors.grey),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
