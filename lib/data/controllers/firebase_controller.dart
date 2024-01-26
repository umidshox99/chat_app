import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/data/services/firebase_service.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final FirebaseService _firebaseService;
  final StorageService _storageService;
  TextEditingController textEditingController = TextEditingController();

  FirebaseController(
    this._firebaseService,
    this._storageService,
  );

  var   userModel = Rx<User?>(null);

  // var userModel = Rx<UserModel?>(null);

  @override
  void onInit() {
    userModel.value = FirebaseAuth.instance.currentUser;
    super.onInit();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  register() async {
    _isLoading.value = true;
    UserCredential? userCredential = await _firebaseService.registerUser(
        emailController.text, passwordController.text);
    if (userCredential != null) {
      _isLoading.value = false;
      Get.offAllNamed(AppRoutes.loginPage);
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
    UserCredential? userCredential = await _firebaseService.loginUser(
      emailController.text,
      passwordController.text,
    );
    if (userCredential != null) {
      _isLoading.value = false;
      userModel.value = FirebaseAuth.instance.currentUser;
      // _storageService.saveUser(UserModel(
      //   userCredential.user?.displayName ?? "",
      //   userCredential.user?.email,
      //   userCredential.user?.emailVerified,
      //   userCredential.user?.isAnonymous,
      //   userCredential.user?.phoneNumber,
      //   userCredential.user?.photoURL,
      //   userCredential.user?.refreshToken,
      //   userCredential.user?.uid,
      // ));
      userCredential.user;
      Get.offAllNamed(AppRoutes.chatPage);
    }
  }

  addMessage() {
    _firebaseService.addMessage(MessageModel(
        UserModel(
          email: FirebaseAuth.instance.currentUser?.email,
        ),
        DateTime.now(),
        textEditingController.text));
    textEditingController.text = '';
  }

  Stream<QuerySnapshot<MessageModel>> getAllMessages() {
    return _firebaseService.getAllMessages();
  }
}
