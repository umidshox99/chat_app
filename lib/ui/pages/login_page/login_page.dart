import 'package:chat_app/data/controllers/local_controller.dart';
import 'package:chat_app/data/controllers/splash_controller.dart';
import 'package:chat_app/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.login.tr),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.registration.tr,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.login.tr,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.enterEmail.tr,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.enterPassword.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
