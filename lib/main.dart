import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:station/core/services/keys.dart';
import 'package:station/core/utils/app_theme.dart';
import 'package:station/presentation/auth/login/view/login.dart';
import 'package:station/presentation/main_page/view/main_page.dart';
import 'package:station/presentation/onboarding/view/onboarding_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      home: prefs.getBool(KeysSharePref.isLogin) == null
          ? PageOnBorarding()
          : prefs.getBool(KeysSharePref.isLogin) == false
              ? Login()
              : MainPage(),
    );
  }
}
