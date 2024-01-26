import 'package:chat_app/data/controllers/firebase_controller.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FirebaseController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.logOutUser();
              },
              icon: Icon(Icons.logout)),
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
    );
  }

  Widget buildBody(FirebaseController controller) {
    return StreamBuilder(
      stream: controller.getAllMessages(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data?.docs;
          data?.sort(
            (a, b) {
              return a.data().dateTime.compareTo(b.data().dateTime);
            },
          );


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
