import 'dart:io';

import 'package:chat_app/data/services/profile_service.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/services/user_service.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService;

  // final StorageService _storageService;

  TextEditingController textEditingController = TextEditingController();

  ProfileController(
    this._profileService,
    // this._storageService,
  );

  var userModel = Rx<User?>(null);
  var pickedImage = Rx<XFile?>(null);

  @override
  void onInit() async {
    userModel.value = FirebaseAuth.instance.currentUser;
    super.onInit();
  }

  var _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  updateProfile() async {
    if (pickedImage.value != null) {
      String? photoUrl =
          await _profileService.uploadPhoto(File(pickedImage.value!.path));
      await _profileService.updateDisplayName(textEditingController.text);
      await _profileService.updatePhoto(photoUrl ?? "");
      Get.offAllNamed(AppRoutes.chatPage);
    }
  }

  pickImage() async {
    pickedImage.value =
        await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
