import 'package:chat_app/data/controllers/user_controller.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:chat_app/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.login.tr),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.registerPage);
            },
            child: Text(
              LocaleKeys.registration.tr,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: Text(
              LocaleKeys.login.tr,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: LocaleKeys.enterEmail.tr,
                    ),
                    controller: controller.emailController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: LocaleKeys.enterPassword.tr,
                    ),
                    controller: controller.passwordController,
                  ),
                ],
              ),
            ),
            if (controller.isLoading.value)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
