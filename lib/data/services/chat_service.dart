import 'package:chat_app/data/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  late CollectionReference<MessageModel> collectionReference;

  ChatService() {
    collectionReference = FirebaseFirestore.instance
        .collection("messages")
        .withConverter<MessageModel>(
          fromFirestore: (snapshots, _) =>
              MessageModel.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  Future addMessage(MessageModel messageModel) async {
    var response = await collectionReference.add(
      messageModel,
    );
  }

  Stream<QuerySnapshot<MessageModel>> getAllMessages() {
    return collectionReference.snapshots();
  }

// Future addText(String text) async {
// //   var response = await FirebaseFirestore.instance.collection("text").add(
// //     {
// //       "text": text,
// //     },
// //   );
// // }
//
// // Stream<QuerySnapshot<Map<String, dynamic>>> getAllText() {
// //   return FirebaseFirestore.instance.collection("text").snapshots();
// // }

}
