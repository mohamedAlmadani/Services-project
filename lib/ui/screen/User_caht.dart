import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/ui/screen/alluser.dart';
import 'package:app03/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('المستخدمين'),
        backgroundColor: appbar,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),

      ),
      body: Obx((){
        return appGet.users.isEmpty?Center(
          child: Text('No Users Found'),
        )
            :ListView.builder(
            itemCount: appGet.users.length,
            itemBuilder: (context,index){
              print('users${appGet.users[index].userId}');

            //  Logger().e("${appGet.users[index].userId}");
              return UserWidget(appGet.users[index]);
            }
        );
      }),
    );
  }
}
class UserWidget extends StatelessWidget {
  AppUser appUser;
  UserWidget(this.appUser);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          onTap: () async {
            String chatId =
            await createChat([appUser.userId, appGet.appUser.userId]);
            Get.to(ChatMessagesPage(appUser, chatId));
          },
          leading: CircleAvatar(
            backgroundColor: appbar,
            radius: 25,
            child: Text(appUser.Name[0].toUpperCase()),
          ),
          title: Text(appUser.Name),
          subtitle: Text(appUser.Email),
          trailing: Icon(Icons.chat_rounded,color: appbar,),
        ),
      ),
    );
  }
}