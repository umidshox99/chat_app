import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:chat_app/data/utils/init_controllers.dart';
import 'package:chat_app/data/utils/messages.dart';
import 'package:chat_app/ui/pages/splash_page/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  initControllers();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splashPage,
      translations: Messages(),
      locale: Get.find<LocaleController>().locale.value,
      fallbackLocale: Locale("uz", "UZ"),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: PostPage(),
    );
  }
}
