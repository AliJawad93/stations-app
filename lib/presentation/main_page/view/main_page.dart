import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/presentation/main_page/controller/main_page_controller.dart';
import 'package:station/presentation/main_page/widgets/custom_bottom_navig_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      init: MainPageController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: controller.getPages(),
        );
      },
    );
  }
}
