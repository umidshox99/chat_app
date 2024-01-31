import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Future<UserCredential?> registerUser(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    print(FirebaseAuth.instance.currentUser?.displayName);
    return userCredential;
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    print(user);
    return userCredential;
  }

  Future updateDisplayName(
    String name,
  ) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  }

  Future updatePhoto(
    String name,
  ) async {
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(name);
  }



}
