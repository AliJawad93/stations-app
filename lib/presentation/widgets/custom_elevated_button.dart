import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/widgets/custom_container.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  EdgeInsetsGeometry? margin;
  double? width;
  double? height;
  CustomElevatedButton(
      {Key? key,
      this.margin,
      required this.onPressed,
      required this.child,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height ?? Get.height * 0.08,
      width: width ?? Get.width,
      margin: margin,
      borderRadius: 10,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
      ),
    );
  }
}
