import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/services/keys.dart';
import 'package:station/domain/entity/response_massage.dart';
import 'package:station/main.dart';
import 'package:station/presentation/auth/signup/controller/signup_controller.dart';
import 'package:station/presentation/main_page/view/main_page.dart';
import 'package:station/presentation/widgets/custom_container.dart';
import 'package:station/presentation/widgets/custom_elevated_button.dart';
import 'package:station/presentation/widgets/custom_text_form.dart';

class CustomSignUpFormCard extends StatelessWidget {
  CustomSignUpFormCard({Key? key}) : super(key: key);

  SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Get.height * 0.75,
      width: Get.width,
      padding: const EdgeInsets.all(10),
      borderRadius: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextForm(
            hintText: "Your name",
            controller: signUpController.getName,
            obscureText: false,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          CustomTextForm(
            hintText: "Your e-mail",
            controller: signUpController.getEmail,
            obscureText: false,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          GetBuilder<SignUpController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your password",
              controller: signUpController.getPassword,
              obscureText: !signUpController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                signUpController.changeVisibility();
              },
            );
          }),
          GetBuilder<SignUpController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your confirm password",
              controller: signUpController.getConfirmPassword,
              obscureText: !signUpController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                signUpController.changeVisibility();
              },
            );
          }),
          CustomElevatedButton(
              onPressed: () async {
                bool iss = signUpController.canSignUp();
                if (!iss) {
                  return;
                }
                signUpController.changeIsloading(true);

                ResponseMassageEntity massage = await signUpController.signUp();

                signUpController.changeIsloading(false);

                if (massage.massage == "good") {
                  prefs.setBool(KeysSharePref.isLogin, true);
                  Get.offAll(() => MainPage());
                } else {
                  Get.snackbar(
                    "Error",
                    massage.massage,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
