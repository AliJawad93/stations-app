import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/auth/login/view/login.dart';
import 'package:station/presentation/auth/signup/controller/signup_controller.dart';
import 'package:station/presentation/auth/signup/widgets/custom_signup_form_card.dart';
import 'package:station/presentation/loading/loading.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<SignUpController>(
            init: SignUpController(),
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
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "SignUp",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                      CustomSignUpFormCard(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("have already an account ?"),
                          InkWell(
                              onTap: () {
                                Get.delete<SignUpController>();
                                Get.offAll(() => Login());
                              },
                              child: Text(
                                " Login",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primary),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
