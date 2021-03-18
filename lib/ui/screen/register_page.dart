import 'package:app03/backend/server.dart';
import 'package:app03/ui/screen/home.dart';
import 'package:app03/ui/screen/login_page.dart';
import 'package:app03/ui/widgets/design%20login%20and%20register%20page.dart';
import 'package:app03/ui/widgets/original_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ResgisterPage extends StatefulWidget {
  @override
  _ResgisterPageState createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  String Name;
  String Email;
  String password;
  GlobalKey<FormState> formKey = GlobalKey();
  saveForm(){
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      saveUserInFirebase({
        'password': this.password,
        'Email': this.Email,
        'Name': this.Name,
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Designfirst(),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                   children: [
                     SizedBox(height: 50.h),
                     TextFormField(
                       onSaved: (value){
                         this.Name = value;

                       },
                       validator: (value) =>
                       value.isEmpty ? 'Enter a valid Name' : null,
                       decoration: InputDecoration(
                         labelText: "Enter Your Name",
                       ),
                     ),
                     SizedBox(
                       height: 12.h,
                     ),
                     TextFormField(
                      onSaved: (value){
                        this.Email = value;

                      },
                       validator: (value) =>
                       value.isEmpty ? 'Enter a valid email' : null,
                       decoration: InputDecoration(
                         labelText: "Enter Your Email",
                       ),
                     ),
                     SizedBox(
                       height: 12.h,
                     ),
                     TextFormField(
                       onSaved: (value){
                         this.password = value;
                       },

                       validator: (value) => value.length < 6
                           ? 'Your password must be larger than 6 characters '
                           : null,
                       decoration: InputDecoration(
                         labelText: "Enter Your Password",
                       ),
                       obscureText: true,
                     ),
                     SizedBox(
                       height: 20.h,
                     ),
                     OriginalButton(
                       text: 'Register',
                       textcolor: Colors.white,
                       bgcolor: Colors.lightBlue,
                       onPressed: ()  {
                         saveForm();

                       },
                     ),
                     SizedBox(
                       height: 5.h,
                     ),
                     GestureDetector(
                       onTap: (){
                         Get.to(Login());
                       },
                         child: Text('Don\'t have an account?', style: TextStyle(
                           color: Colors.black54,
                           fontSize: 18,
                         ),
                         ),


                     )
                   ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
