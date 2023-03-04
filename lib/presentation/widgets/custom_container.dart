import 'package:flutter/material.dart';
import 'package:station/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  Widget child;
  double borderRadius;
  AlignmentGeometry? alignment;
  Color? color;
  CustomContainer({
    Key? key,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    required this.child,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          )
        ],
      ),
      child: child,
    );
  }
}
