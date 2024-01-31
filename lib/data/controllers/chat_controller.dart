import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/data/services/chat_service.dart';
import 'package:chat_app/data/services/storage_service.dart';
import 'package:chat_app/data/utils/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatService _firebaseService;

  // final StorageService _storageService;
  TextEditingController textEditingController = TextEditingController();

  ChatController(
    this._firebaseService,
    // this._storageService,
  );

  var userModel = Rx<User?>(null);

  // var userModel = Rx<UserModel?>(null);

  initUser() {
    userModel.value = FirebaseAuth.instance.currentUser;
  }

  var _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  logOutUser() {
    FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.loginPage);
  }

  addMessage() {
    _firebaseService.addMessage(
      MessageModel(
        UserModel(
          email: FirebaseAuth.instance.currentUser?.email,
        ),
        DateTime.now(),
        textEditingController.text,
        "",
        false,
      ),
    );
    textEditingController.text = '';
  }

  readMessage() async {
    await _firebaseService.readMessage();
  }

  Stream<QuerySnapshot<MessageModel>> getAllMessages() {
    return _firebaseService.getAllMessages();
  }
}
