import 'package:flutter/material.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';

class PedalaInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final void Function()? trailingTapped;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  PedalaInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: AppColors.pedalaRed),
      child: TextField(
        controller: controller,
        style: const TextStyle(height: 1),
        obscureText: password,
        decoration: InputDecoration(
          hintText: placeholder,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          filled: true,
          fillColor: AppColors.pedalaCoolWhite,
          prefixIcon: leading,
          suffixIcon: trailing != null
              ? GestureDetector(
                  onTap: trailingTapped,
                  child: trailing,
                )
              : null,
          border: circularBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.pedalaLightGrey,
            ),
          ),
          errorBorder: circularBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.pedalaRed,
            ),
          ),
          focusedBorder: circularBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.pedalaRed,
            ),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.pedalaRed,
            ),
          ),
        ),
      ),
    );
  }
}
