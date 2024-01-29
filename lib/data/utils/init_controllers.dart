import 'package:chat_app/data/controllers/chat_controller.dart';
import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/user_controller.dart';
import 'package:chat_app/data/services/chat_service.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/services/user_service.dart';
import 'package:get/get.dart';

void initControllers() {
  /// permanent
  // Get.put(SplashController(), permanent: true);
  Get.put(LocaleController(StorageService()));
  Get.put(ChatController(ChatService()));
  Get.put(UserController(UserService()));
}
