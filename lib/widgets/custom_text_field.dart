import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController textEditingController; // required
  String? hintText; // required
  String labelText; // required
  IconData? prefixIcon; // optional
  IconData? suffixIcon; // optional
  Color? filledColor ;

  CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.filledColor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(labelText),
          fillColor: filledColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          suffixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIcon: suffixIcon != null ? Icon(suffixIcon) : null),
    );
  }
}
