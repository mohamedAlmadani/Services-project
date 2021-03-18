import 'package:app03/model/AppUser.dart';
import 'package:get/get.dart';

class AppGet extends GetxController {
  AppUser appUser;
  var users =<AppUser>[].obs;
  setUserModel(AppUser appUser) {
    this.appUser = appUser;
    update();
  }


}