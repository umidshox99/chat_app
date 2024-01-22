import 'package:chat_app/data/utils/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // var text = "init".obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.languagePage);
      // text.value = "done";
    });
  }
}
