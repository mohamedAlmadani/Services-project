import 'package:app03/backend/AppGet.dart';
import 'package:app03/ui/screen/splachScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'backend/myprovider.dart';
import 'ui/screen/home.dart';



void main() async{
  Get.put(AppGet());


  runApp(ChangeNotifierProvider<myProvider>(
    create: (context){
      return myProvider();
    },
      child: MyApp()));
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application',
      theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xfff2f9fe),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(25),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
        primarySwatch: Colors.blue,

      ),
      home: App (),


    );
  }
}
class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Splashscreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}


