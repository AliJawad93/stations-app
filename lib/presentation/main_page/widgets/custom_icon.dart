import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/main_page/controller/main_page_controller.dart';

class CustomIconBottomBar extends StatelessWidget {
  final int indexPage;
  final IconData iconData;
  final double size;
  const CustomIconBottomBar({
    Key? key,
    required this.indexPage,
    required this.iconData,
    required this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.setCurrentIndex(indexPage);
          },
          child: Container(
            height: Get.height,
            width: Get.width * 0.5,
            child: Icon(
              iconData,
              size: size,
              color: controller.getCurrentIndex != indexPage
                  ? AppColors.shadow
                  : AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}
