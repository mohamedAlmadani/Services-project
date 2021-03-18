import 'package:app03/model/AppUser.dart';

class Repository {
  Repository._();

  static Repository repository = Repository._();
  AppUser appUser;
}