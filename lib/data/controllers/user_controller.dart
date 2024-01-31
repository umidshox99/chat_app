import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/services/user_service.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserService _userService;

  // final StorageService _storageService;

  TextEditingController textEditingController = TextEditingController();

  UserController(
    this._userService,
    // this._storageService,
  );

  var userModel = Rx<User?>(null);

  @override
  void onInit() async {
    userModel.value = FirebaseAuth.instance.currentUser;
    super.onInit();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  register() async {
    _isLoading.value = true;
    UserCredential? userCredential = await _userService.registerUser(
        emailController.text, passwordController.text);
    if (userCredential != null) {
      _isLoading.value = false;
      Get.offAllNamed(AppRoutes.profilePage);
      emailController.text = "";
      passwordController.text = "";
    }
  }

  logOutUser() {
    FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.loginPage);
  }

  login() async {
    _isLoading.value = true;
    UserCredential? userCredential = await _userService.loginUser(
      emailController.text,
      passwordController.text,
    );
    if (userCredential != null) {
      _isLoading.value = false;
      userModel.value = FirebaseAuth.instance.currentUser;
      userCredential.user;
      Get.offAllNamed(AppRoutes.chatPage);
    }
  }
}
