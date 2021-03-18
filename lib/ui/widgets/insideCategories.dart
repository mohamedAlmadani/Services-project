import 'package:app03/backend/myprovider.dart';
import 'package:app03/model/insidecategoriesModel.dart';
import 'package:app03/ui/screen/deatails.dart';
import 'package:app03/ui/widgets/containerinsideCategoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:app03/backend/server.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class insideCategories extends StatelessWidget {
  List<insideCategoriesModle> list =[];


  insideCategories({this.list});
  insideCategoriesModle insCat;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);

    return  Scaffold(
      appBar: AppBar(
        title: Text('الأشخاص'),
        centerTitle: true,
      ),
      body:
         GestureDetector(
          onTap: (){


          },
           child: Container(
            height: 510.h,
            child: ListView(
              shrinkWrap: false,
              primary: false,

              children: list.map((e) => insideCintainerCat(
               image: e.image,name: e.name,
                onTap: (){
                  Get.to(Deatails(
                    name: e.name,
                    image: e.image,
                    number: e.number,
                    descrption: e.descrption,
                    imagedc: e.imagedc,

                  ));
                }




              )).toList(),
            ),
      ),
         ),


















    );
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
            rating=value;
            addStar(
             {
             'rating':this.rating,
             }
            );
          });
          print("rating value -> $value");


        },
        starCount: 5,
        rating: rating,
        size: 30.0,
        isReadOnly:true,
        color: Colors.amber,
        borderColor: Colors.amber,
        spacing:0.0
    );
  }
}


// Selector<myProvider, List<insideCategoriesModle>>(
// builder: (context, value, child) {
// return value.isEmpty?Center(child: CircularProgressIndicator(),):
// ListView.builder(
// itemCount: value.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap:(){
// Get.to(Comments());
// // Get.to(Deatails(insCat:value[index] ,messageId: "d",));
// } ,
// child: Container(
// child: Row(
// children: [
// Container(
// height: 100,
// width: 100,
// child: Image.network(
// value[index].image??'hhh',
// fit: BoxFit.cover,
// ),
// ),
// Expanded(
// child: Column(
// children: [
// Text(value[index].name??''),
// // Text(value[index].price??''),
// // Text(value[index].description??''),
//
//
// ],
// ),
// )
// ],
// ),
// ),
// );
// },
// );
// },
// selector: (x, y) {
// return y.najarCategoriesList;
// },
// ),















