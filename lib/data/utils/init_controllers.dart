import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:get/get.dart';

void initControllers() {
  /// permanent
  Get.put(SplashController(), permanent: true);
  Get.put(LocaleController(), permanent: true);
}
