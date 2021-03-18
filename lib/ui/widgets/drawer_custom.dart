import 'package:app03/backend/Repository.dart';
import 'package:app03/backend/server.dart';
import 'package:app03/ui/screen/User_caht.dart';
import 'package:app03/ui/screen/posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(

        children: [
          UserAccountsDrawerHeader(
              accountName: Center(
                child: CircleAvatar(
                  radius: 30,
                  child: Text(Repository.repository.appUser.Name[0].toUpperCase()??''),
                ),
              ),
              accountEmail: Center(child: Text(Repository.repository.appUser.Email??''))),

          Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              onTap: () {
                Get.to(UserPage());
              },
              title: Text('الرسائل'),

              //title: Text('mohammed'),
              leading: Icon(Icons.message,color: Colors.lightBlue,),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              onTap: () {
                Get.to(Post());
              },
              title: Text('المنشورات'),
              leading: Icon(Icons.post_add,color: Colors.lightBlue,),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              onTap: () {
                signOut();
              },
              title: Text('خروج'),
              leading: Icon(Icons.logout,color: Colors.lightBlue,),
            ),
          ),
        ],
      ),
    );
  }
}
