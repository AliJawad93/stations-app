import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/widgets/custom_container.dart';

class CustomTextForm extends StatelessWidget {
  String hintText;
  TextEditingController? controller;

  bool obscureText;
  void Function()? onPressedSuffixIcon;
  void Function(String)? onChanged;
  bool showVisibilityIcon;
  Widget? prefixIcon;
  Color? backgroundColor;
  CustomTextForm({
    Key? key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.showVisibilityIcon = false,
    this.prefixIcon,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            suffixIcon: !showVisibilityIcon
                ? null
                : IconButton(
                    onPressed: onPressedSuffixIcon,
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined))),
      ),
    );
  }
}
