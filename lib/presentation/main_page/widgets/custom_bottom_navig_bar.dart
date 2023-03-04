import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/main_page/widgets/custom_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10.0,
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      color: AppColors.white,
      child: SizedBox(
        height: Get.height * 0.085,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomIconBottomBar(
              indexPage: 0,
              iconData: Icons.map,
              size: 30,
            ),
            CustomIconBottomBar(
              indexPage: 1,
              iconData: Icons.local_gas_station,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
