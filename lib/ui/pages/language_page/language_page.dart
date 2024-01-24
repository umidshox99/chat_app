import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:chat_app/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.find<LocaleController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.selectLanguage.tr),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          Get.offNamed(AppRoutes.loginPage);
        },
        child: Text(LocaleKeys.next.tr),
      ),
      body: Obx(
        () {
          print(controller.locale);
          return Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx(
              //   () => Text(Get.find<SplashController>().text.value),
              // ),
              TextButton(
                onPressed: () {
                  controller.changeLanguage(Locale("uz", "UZ"));
                },
                child: Text(
                  "UZ",
                  style: TextStyle(
                    color: controller.locale == Locale("uz", "UZ")
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.changeLanguage(Locale("en", "US"));
                },
                child: Text(
                  "EN",
                  style: TextStyle(
                    color: controller.locale == Locale("en", "US")
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.changeLanguage(Locale("ru", "RU"));
                },
                child: Text(
                  "RU",
                  style: TextStyle(
                    color: controller.locale == Locale("ru", "RU")
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
