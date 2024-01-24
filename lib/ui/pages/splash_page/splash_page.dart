import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(StorageService()),
      builder: (SplashController controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("ChatApp"),
              ],
            ),
          ),
        );
      },
    );
  }
}
