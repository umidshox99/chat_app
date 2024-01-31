import 'dart:io';

import 'package:chat_app/data/controllers/profile_controller.dart';
import 'package:chat_app/data/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(ProfileService()),
      builder: (ProfileController controller) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
            ),
            bottomNavigationBar: TextButton(
              onPressed: () {
                controller.updateProfile();
              },
              child: Text("SAVE"),
            ),
            body: Center(
              child: Column(
                children: [
                  if (controller.pickedImage.value != null)
                    Image.file(File(controller.pickedImage.value!.path))
                  else
                    Icon(
                      Icons.person,
                    ),
                  TextButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    child: Text("choose image"),
                  ),
                  TextField(
                    controller: controller.textEditingController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
