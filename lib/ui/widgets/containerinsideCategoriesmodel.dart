import 'package:app03/backend/Repository.dart';
import 'package:app03/backend/server.dart';
import 'package:app03/model/AppUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class insideCintainerCat extends StatelessWidget {
  String name;
  String image;
  String number;
  String imagedc;
  String descrption;
  Function onTap;
  AppUser appUser;

  insideCintainerCat({this.image, this.name, this.appUser, this.onTap,this.number,this.imagedc,this.descrption});
  var rating = 0.0;
  double star;
  String userId;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GestureDetector(
          onTap: () {
            //  String chatId =
            //  await createChat([appUser.userId, appGet.appUser.userId]);
            // Get.to(ChatMessagesPage(appUser,chatId));
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              height: 120.h,
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                    height: 120.h,
                    width: 120.w,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h, horizontal: 10.w),
                    child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name ?? '',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),

                          Expanded(child: Star(),),
                        ]))
              ])),
        ));
  }
}

class Star extends StatefulWidget {
  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
        allowHalfRating: false,
        onRated: (value) {
          setState(() {
            rating = value;
            addStar({
              'rating': this.rating,
            });
            this.rating = value;
          });
          print("rating value -> $value");
        },
        starCount: 5,
        rating: rating,
        size: 25.0,
        color: Colors.amber,
        borderColor: Colors.amber,
        spacing: 0.0);
  }
}

// SmoothStarRating(
//     allowHalfRating: false,
//     onRated: (value) {
//       setState(() {
//         addStar({
//           'star': this.star,
//         });
//         rating = value;
//         this.star = value;
//
//         print('Ratimg id:$rating');
//       });
//     },
//     starCount: 5,
//     rating: rating,
//     size: 30.0,
//     color: Colors.amber,
//     borderColor: Colors.amber,
//     spacing: 0.0),
// Text('$rating'),
