import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/ui/screen/home.dart';
import 'package:app03/ui/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class Splashscreen extends StatefulWidget {

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String userId;
  AppUser appUser;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    splachMethods();

    Future.delayed(Duration(seconds: 4)).then((value) =>
    {
      userId == null ? Get.off(Login()) : Get.off(HomeScreen())
     //    Get.to(Login()),
    });


   //appUser=SPHelper.spHelper.getUser();
    appGet.appUser=appUser;
    userId = getUserId();
    if(userId!=null){
    fetchSplachData();

      }
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 250.w,
                  height: 250.h,
                  fit: BoxFit.cover,

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}