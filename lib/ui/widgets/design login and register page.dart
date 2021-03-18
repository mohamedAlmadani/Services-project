import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Designfirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);

    return Container(
      child:  Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              )
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60.h,),
                Text("Hello!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),),
                SizedBox(height: 25.h,),
                Image.asset('assets/images/b1.png',height: 200.h,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
