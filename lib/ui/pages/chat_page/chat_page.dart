import 'package:chat_app/data/controllers/chat_controller.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(ChatService())..initUser(),
      builder: (ChatController controller) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.network(
                    controller.userModel.value?.photoURL ?? "",
                    height: 40,
                    width: 40,
                  ),
                  Text(controller.userModel.value?.displayName ?? "")
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    controller.logOutUser();
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: buildBody(controller)),
                  TextField(
                    controller: controller.textEditingController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                      onPressed: () {
                        controller.addMessage();
                      },
                      icon: Icon(Icons.send),
                    )),
                  ),
                ],
              ),
            ),

            // body: Image.network(
            //     "https://firebasestorage.googleapis.com/v0/b/chatapp-e20ef.appspot.com/o/image_2024-01-29_15-30-23.png?alt=media&token=2afffa01-4876-417e-bb75-faea21779d00"),
          ),
        );
      },
    );
  }

  Widget buildBody(ChatController controller) {
    return StreamBuilder(
      stream: controller.getAllMessages(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data?.docs;
          print(data!.first.reference.path);
          data?.sort(
            (a, b) {
              return a.data().dateTime.compareTo(b.data().dateTime);
            },
          );
          // controller.readMessage();
          return ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (context, index) {
              var message = data![index].data();
              return Container(
                alignment:
                    message.user.email == controller.userModel.value?.email
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(message.user.email ?? ""),
                    Text(message.text ?? ""),
                  ],
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
