import 'dart:io';

import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileService {
  Reference? ref;

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

  Future<String?> uploadPhoto(
    File file,
  ) async {
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    String? userImageUrl;

    String name = file.path.split("/").last;
    ref = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child("/${name}");
    TaskSnapshot taskSnapshot = await ref!.putFile(File(file.path), metadata);

    userImageUrl = await (taskSnapshot).ref.getDownloadURL();
    print(userImageUrl);
    return userImageUrl;
  }
}
