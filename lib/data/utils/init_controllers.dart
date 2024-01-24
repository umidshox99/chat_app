import 'package:chat_app/data/controllers/firebase_controller.dart';
import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/services/firebase_service.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:get/get.dart';

void initControllers() {
  /// permanent
  // Get.put(SplashController(), permanent: true);
  Get.put(LocaleController(StorageService()));
  Get.put(FirebaseController(FirebaseService(), StorageService()));
}
