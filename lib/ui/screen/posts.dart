import 'package:app03/backend/Repository.dart';
import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/ui/widgets/progress.dart';
import 'package:app03/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  AppUser appuser;
  TextEditingController PostController = TextEditingController();
  addComment() {
    Map map = {
      "username": Repository.repository.appUser.Name,
      "comment": PostController.text,
      "timestamp": timestamps,
      "userId": Repository.repository.appUser.userId,
    };
    addpost(map);

    PostController.clear();
  }

  buildComments() {
    return StreamBuilder(
        stream: postRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return circularProgress();
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');

            default:
              return ListView.builder(
                  itemCount: snapshot.data.docs.length ?? 0,
                  itemBuilder: (int, index) {
                    print(snapshot.data.docs.length);
                    DocumentSnapshot document = snapshot.data.docs[index];

                    postmodel.fromMap(document.data());
                    return Card(
                      child: ListTile(
                        title: Text(
                          document['comment'],
                        ),
                        leading: CircleAvatar(
                          backgroundColor: appbar,
                          radius: 25,
                          child: Text(document['username']),
                        ),
                      ),
                    );
                  });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('انشاء منشور'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(22),
            ),
          ),
          backgroundColor: appbar,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ListTile(
                  title: TextFormField(
                    cursorColor: Colors.lightBlue,
                    controller: PostController,
                    decoration: InputDecoration(
                        labelText: "بم تفكر؟",
                        labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  trailing: OutlineButton(
                    onPressed: addComment,
                    borderSide: BorderSide.none,
                    disabledBorderColor: Colors.lightBlue,
                    child: Text(
                      'نشر',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Divider(),
              Expanded(child: buildComments()),
            ],
          ),
        ));
  }
}

class postmodel extends StatelessWidget {
  String username;
  String userId;

  String comment;
  Timestamp timestamp;

  postmodel({
    this.username,
    this.userId,
    this.comment,
    this.timestamp,
  });

  postmodel.fromMap(Map map) {
    this.username = map['username'];
    this.userId = map['userId'];
    this.comment = map['comment'];
    this.timestamp = map['timestamp'];
  }
  toJson() {
    return {
      'username': this.username,
      'comment': this.comment,
      'userId': this.userId,
      'timestamp': this.timestamp
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            comment,
            style: TextStyle(color: Colors.green),
          ),
          // leading: CircleAvatar(
          //   backgroundImage: CachedNetworkImageProvider(avatarUrl),
          // ),
          subtitle: Text(timeago.format(timestamp.toDate())),
        ),
        Divider(),
      ],
    );
  }
}
