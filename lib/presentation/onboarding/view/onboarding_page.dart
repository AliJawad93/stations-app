import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:station/core/services/keys.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/core/utils/app_image_path.dart';
import 'package:station/main.dart';
import 'package:station/presentation/auth/login/view/login.dart';
import '../widgets/build_images.dart';

class PageOnBorarding extends StatelessWidget {
  const PageOnBorarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome',
              body: 'App Stations location ',
              image: const BuildImages(image: AppImagePath.markerIcon),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Locations',
              body: 'You can find the station faster and take short path',
              image: const BuildImages(image: AppImagePath.onbaording2),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'offers',
              body: 'You can see offers of stations',
              image: const BuildImages(image: AppImagePath.onbaording3),
              decoration: getPageDecoration(),
            ),
          ],
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text('Skip'),
          dotsDecorator: getDotDecoration(),
          nextFlex: 0,
          skipOrBackFlex: 0,
          animationDuration: 500,
          isProgressTap: true,
          isProgress: true,
          onChange: (index) => print(index),
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(fontSize: 20),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.all(20),
      pageColor: Colors.white,
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: const Color(0xFFBDBDBD),
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: AppColors.primary,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  void goToHome(context) {
    prefs.setBool(KeysSharePref.isLogin, false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
