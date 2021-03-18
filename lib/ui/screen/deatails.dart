import 'dart:async';

import 'package:app03/backend/Repository.dart';

import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/model/MessageMode.dart';
import 'package:app03/model/insidecategoriesModel.dart';
import 'package:app03/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app03/ui/widgets/header.dart';
import 'package:app03/ui/widgets/progress.dart';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Deatails extends StatefulWidget {
  String name;
  String image;
  String number;
  String imagedc;
  String descrption;

  Deatails({this.name, this.image,this.descrption,this.imagedc,this.number});

  @override
  _DeatailsState createState() => _DeatailsState();
}

class _DeatailsState extends State<Deatails> {
  TextEditingController controller = TextEditingController();

  ScrollController scrollController = ScrollController();

  insideCategoriesModle insCat;

  AppUser appUser;

  createWidget(MessageMode messageMode) {
    bool isMe = !(messageMode.senderId == appUser.userId);
    if (isMe) {
      return cardmessage(messageMode);
    } else {
      return cardmessage(messageMode);
    }
  }

  Widget cardmessage(MessageMode messageMode) {
    print(messageMode.content);
    return ListTile(
      title: Text(
        messageMode.content,
        style: TextStyle(color: Colors.amber),
      ),
      trailing: Text(Repository.repository.appUser.Name),
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('التفاصيل'),
        centerTitle: true,
        backgroundColor: appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
      ),
      body:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              height: 120.h,
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.image,
                        ),
                        fit: BoxFit.cover,
                      )),
                  height: 120.h,
                  width: 120.w,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Column(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name ?? '',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                               widget.number??''
                            ),

                          ])),
                ),

              ]),
            ),
            Text('نبذة عني:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87
            ),
            ),
            Text(widget.descrption??'',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87
              ),

            ),
            Text('أعمالي:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.imagedc??'',
                width: 120.w,
                height: 100.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),

              ),

            ),
            Comments()

            // Expanded(
            //     child: Container(
            //         child: StreamBuilder<QuerySnapshot>(
            //   stream: getChatMessages(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> dataSnapShot) {
            //     Timer(
            //         Duration(milliseconds: 100),
            //         () => scrollController
            //             .jumpTo(scrollController.position.maxScrollExtent));
            //     if (dataSnapShot.connectionState == ConnectionState.waiting) {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (dataSnapShot.hasData) {
            //       List<MessageMode> messages = dataSnapShot.data.docs
            //           .map((e) => MessageMode.fromMap(e.data()))
            //           .toList();
            //       return ListView.builder(
            //           controller: scrollController,
            //           itemCount: messages.length,
            //           itemBuilder: (context, index) {
            //             return cardmessage(messages[index]);
            //           });
            //     }
            //     return Center(
            //       child: Text('No Messages'),
            //     );
            //   },
            // ))),

            // Expanded(
            //     child: Container(
            //         child: StreamBuilder<QuerySnapshot>(
            //   stream: getChatMessages(Repository.repository.appUser.userId),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> dataSnapShot) {
            //     // Timer(
            //     //     Duration(milliseconds: 100),
            //     //         ()=>scrollController.jumpTo(scrollController.position.maxScrollExtent)
            //     //
            //     // );
            //     if (dataSnapShot.connectionState == ConnectionState.done) {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (dataSnapShot.hasData) {
            //       List<MessageMode> messages = dataSnapShot.data.docs
            //           .map((e) => MessageMode.fromMap(e.data()))
            //           .toList();
            //       print('message ${messages.length}');
            //       return ListView.builder(
            //           controller: scrollController,
            //           itemCount: messages.length,
            //           itemBuilder: (context, index) {
            //             print(messages[index]);
            //             return cardmessage(messages[index]);
            //           });
            //     } else
            //     return Center(
            //       child: Text('No Messages'),
            //     );
            //   },
            // ))),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration:
            //       BoxDecoration(border: Border.all(color: Colors.black87)),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: TextFormField(
            //         controller: controller,
            //         onTap: () {},
            //         decoration: InputDecoration(
            //             hintText: 'Enter your message', border: InputBorder.none),
            //       )),
            //       IconButton(
            //           icon: Icon(Icons.send),
            //           onPressed: () {
            //             DateTime dateTime = DateTime.now();
            //             MessageMode messageMode = MessageMode(
            //               content: controller.text,
            //
            //               senderId: Repository.repository.appUser.userId,
            //               senderName: Repository.repository.appUser.Name,
            //               timeStamp: FieldValue.serverTimestamp(),
            //               date: '${dateTime.year}-${dateTime.month}-${dateTime}',
            //               time: '${dateTime.hour}:${dateTime.minute}',
            //             );
            //             createMessage(messageMode);
            //             Timer(
            //                 Duration(milliseconds: 100),
            //                 () => scrollController.jumpTo(
            //                     scrollController.position.maxScrollExtent));
            //             controller.clear();
            //           })
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Comments extends StatefulWidget {
  String insideId;
   String postOwnerId;

  Comments({
   this.insideId,
    this.postOwnerId,
  });

  @override
  CommentsState createState() => CommentsState(
    insideId: this.insideId,
        postOwnerId: this.postOwnerId,
      );
}

class CommentsState extends State<Comments> {
  AppUser appuser;
  TextEditingController commentController = TextEditingController();
   String insideId;
   String postOwnerId;

  CommentsState({
   this.insideId,
    this.postOwnerId,
  });

  buildComments() {
    return StreamBuilder(
        stream:  commentsRef.snapshots(),
        builder: (context,  snapshot) {
          if (!snapshot.hasData)
            return circularProgress();
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');

            default:
              List<Comment> comments = [];

              return ListView.builder(
                  itemCount:snapshot.data.docs.length??0 ,
                  itemBuilder: (int,index){
                    print(snapshot.data.docs.length);
                   DocumentSnapshot document= snapshot.data.docs[index];

                    Comment.fromMap(document.data());
                      return Card(
                        child: ListTile(
                          subtitle: Text(document['comment'],),
                          trailing: CircleAvatar(
                            child: Text(document['username']),
                          ),

                        ),
                      );







                  });
          }

        });
  }

  addComment() {
    Map map ={
      "username": Repository.repository.appUser.Name,
      "comment": commentController.text,
      "timestamp": timestamps,
      "userId": Repository.repository.appUser.userId,
    };
    addcomment(map);



    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: Column(
          children: <Widget>[
            Expanded(child: buildComments()),
            Divider(),
            ListTile(
              title: TextFormField(
                controller: commentController,
                decoration: InputDecoration(labelText: "Write a comment..."),
              ),
              trailing: OutlineButton(
                onPressed: addComment,
                borderSide: BorderSide.none,
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comment {
   String username;
   String userId;


  String comment;
 Timestamp timestamp;

  Comment({
    this.username,
    this.userId,
    this.comment,
    this.timestamp,
  });

  Comment.fromMap(Map map) {

      this.username= map['username'];
     this. userId=map['userId'];
     this.comment= map['comment'];
    this.timestamp= map['timestamp'];

  }
  toJson(){
    return{
      'username':this.username,
      'comment':this.comment,
      'userId':this.userId,
      'timestamp':this.timestamp
    };
  }


}
