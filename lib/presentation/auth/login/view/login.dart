import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/core/utils/app_image_path.dart';
import 'package:station/presentation/auth/login/controller/login_controller.dart';
import 'package:station/presentation/auth/signup/view/signup.dart';
import 'package:station/presentation/loading/loading.dart';
import '../widgets/custom_login_form.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                if (controller.getIsloading) {
                  return const Loading();
                }

                return SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImagePath.bg,
                              width: 250,
                            )),
                        CustomLoginFormCard(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Don't have an account ?"),
                            InkWell(
                                onTap: () {
                                  Get.delete<LoginController>();
                                  Get.to(() => SignUp());
                                },
                                child: Text(
                                  " SignUp",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
