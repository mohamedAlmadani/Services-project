import 'dart:async';

import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/model/MessageMode.dart';
import 'package:app03/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:get/get.dart';
class ChatMessagesPage  extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  AppUser otherUser;
  String chatId;
  ChatMessagesPage(this.otherUser, this.chatId);
  Widget createMyMessage(MessageMode messageMode){
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: Colors.blue,
      child: Container(
        constraints:BoxConstraints(
          maxWidth: MediaQuery.of(Get.context).size.width * 0.7,

        ),
        child: Text(messageMode.content),
      ),




    );
  }
  createWidget(MessageMode messageMode) {
    bool isMe = !(messageMode.senderId == otherUser.userId);
    if (isMe) {
      return createMyMessage(messageMode);
    } else {
      return createFriendMessage(messageMode);
    }
  }
  Widget createFriendMessage(MessageMode messageMode) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(otherUser.Name[0].toUpperCase()),
        ),
        ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 20),
          backGroundColor: Colors.red,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(Get.context).size.width * 0.7,
            ),
            child: Text(messageMode.content),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('الرسائل'),
        backgroundColor: appbar,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(child:StreamBuilder<QuerySnapshot>(
            stream:getChatMessages(chatId) ,
            builder: (context,AsyncSnapshot<QuerySnapshot> dataSnapShot){
              Timer(
                  Duration(milliseconds: 100),
                      ()=>scrollController.jumpTo(scrollController.position.maxScrollExtent)

              );
              if(dataSnapShot.connectionState== ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );

              } else if(dataSnapShot.hasData){
                List<MessageMode> messages = dataSnapShot.data.docs
                    .map((e) => MessageMode.fromMap(e.data()))
                    .toList();
                return ListView.builder(
                    controller: scrollController,

                    itemCount: messages.length,
                    itemBuilder: (context,index){
                      return createWidget(messages[index]);

                    });
              }
              return Center(
                child: Text('No Messages'),
              );
            },
          ))),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  controller: controller,
                  onTap: (){},
                  decoration: InputDecoration(
                      hintText: 'Enter your message',
                      border: InputBorder.none
                  ),

                )),
                IconButton(icon: Icon(Icons.send), onPressed: (){
                  DateTime dateTime =DateTime.now();
                  MessageMode  messageMode=MessageMode(
                      content: controller.text,
                      senderId: appGet.appUser.userId,
                      senderName: appGet.appUser.Name,
                      timeStamp: FieldValue.serverTimestamp(),
                      date: '${dateTime.year}-${dateTime.month}-${dateTime}',
                      time: '${dateTime.hour}:${dateTime.minute}',
                      chatId: chatId


                  );
                  createMessage(messageMode);
                  Timer(
                      Duration(milliseconds: 100),
                          () => scrollController.jumpTo(
                          scrollController.position.maxScrollExtent));
                  controller.clear();


                })
              ],
            ),
          )

        ],
      ),
    );
  }
}