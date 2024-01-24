import 'package:chat_app/data/controllers/firebase_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:chat_app/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FirebaseController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.registration.tr),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.loginPage);
            },
            child: Text(
              LocaleKeys.login.tr,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.register();
            },
            child: Text(
              LocaleKeys.registration.tr,
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
              Center(child: const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
