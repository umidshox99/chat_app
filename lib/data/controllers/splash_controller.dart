import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var text = "init".obs;
  var userModel = Rx<User?>(null);

  // var userModel = Rx<UserModel?>(null);
  final StorageService _storageService;

  SplashController(this._storageService);

  @override
  void onInit() {
    super.onInit();
    // userModel.value = _storageService.getUser();
    userModel.value = FirebaseAuth.instance.currentUser;

    startTimer();
  }

  startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      if (userModel.value != null) {
        if (userModel.value?.displayName?.isEmpty ?? false)
          Get.offNamed(AppRoutes.profilePage);
        else
          Get.offNamed(AppRoutes.chatPage);
      } else
        Get.offNamed(AppRoutes.languagePage);

      print("TASK DONE");
      text.value = "done";
    });
  }
}
