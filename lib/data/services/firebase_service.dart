import 'package:chat_app/data/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  late CollectionReference<MessageModel> collectionReference;

  FirebaseService() {
    collectionReference = FirebaseFirestore.instance
        .collection("messages")
        .withConverter<MessageModel>(
          fromFirestore: (snapshots, _) =>
              MessageModel.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  Future<UserCredential?> registerUser(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    //
    // FirebaseAuth.instance.currentUser.upda

    print(user);
    return userCredential;
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    print(user);
    return userCredential;
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
//   var response = await FirebaseFirestore.instance.collection("text").add(
//     {
//       "text": text,
//     },
//   );
// }
//
// Stream<QuerySnapshot<Map<String, dynamic>>> getAllText() {
//   return FirebaseFirestore.instance.collection("text").snapshots();
// }
}
