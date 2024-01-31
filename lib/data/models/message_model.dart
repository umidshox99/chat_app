import 'package:chat_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageModel {
  final UserModel user;
  final DateTime dateTime;
  final String text;
  final String? file;
  final bool? isRead;

  MessageModel(
    this.user,
    this.dateTime,
    this.text,
    this.file,
    this.isRead,
  );

  factory MessageModel.fromJson(Map<String, dynamic> data) {
    return MessageModel(
      UserModel.fromJson(data["user"]),
      data["dateTime"].toDate(),
      data["text"],
      data["file"],
      data["isRead"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "dateTime": dateTime,
      "text": text,
      "file": file,
      "isRead": isRead,
    };
  }
}
