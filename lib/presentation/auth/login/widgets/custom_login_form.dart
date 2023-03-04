import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/services/keys.dart';
import 'package:station/domain/entity/response_massage.dart';
import 'package:station/main.dart';
import 'package:station/presentation/auth/login/controller/login_controller.dart';
import 'package:station/presentation/main_page/view/main_page.dart';
import 'package:station/presentation/widgets/custom_container.dart';
import 'package:station/presentation/widgets/custom_elevated_button.dart';
import 'package:station/presentation/widgets/custom_text_form.dart';

class CustomLoginFormCard extends StatelessWidget {
  CustomLoginFormCard({Key? key}) : super(key: key);

  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Get.height * 0.45,
      width: Get.width,
      padding: const EdgeInsets.all(10),
      borderRadius: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextForm(
            hintText: "Your e-mail",
            controller: loginController.getEmail,
            obscureText: false,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          GetBuilder<LoginController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your password",
              controller: loginController.getPassword,
              obscureText: !loginController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                loginController.changeVisibility();
              },
            );
          }),
          CustomElevatedButton(
              onPressed: () async {
                bool iss = loginController.canSignUp();
                if (!iss) {
                  return;
                }

                loginController.changeIsloading(true);

                ResponseMassageEntity massage = await loginController.signUp();

                loginController.changeIsloading(false);

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
              child: const Text("Login"))
        ],
      ),
    );
  }
}
