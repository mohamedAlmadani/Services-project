import 'package:app03/model/AppUser.dart';
import 'package:app03/model/CategoriesModel.dart';
import 'package:app03/model/MessageMode.dart';
import 'package:app03/model/insidecategoriesModel.dart';
import 'package:app03/ui/screen/deatails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class myProvider extends ChangeNotifier {
  List<MessageMode> message = [];
  AppUser appUser;
  List<Comment> comments=[];
  setComment(List<Comment> value){
    this.comments=value;
    notifyListeners();
  }


  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setMessageMode(List<MessageMode> value) {
    this.message = value;
    notifyListeners();
  }

  List<CategoriesModel> najarList = [];
  CategoriesModel najarModel;

  Future<void> getNajar() async {
    List<CategoriesModel> newnajarList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('نجار')
        .get();
    querySnapshot.docs.forEach((element) {
      najarModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newnajarList.add(najarModel);
      najarList = newnajarList;
    });
    notifyListeners();
  }

  get thrownajarList {
    return najarList;
  }

  ///////////// najat categories list //////////
  List<insideCategoriesModle> najarCategoriesList = [];
  insideCategoriesModle najarCategoriesModle;

  Future<void> getnajarCategorieList() async {
    List<insideCategoriesModle> newnajarCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('نجار')
        .get();
    querySnapshot.docs.forEach((element) {
      najarCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newnajarCategoriesList.add(najarCategoriesModle);
      najarCategoriesList = newnajarCategoriesList;
    });

    notifyListeners();
  }

  get thrownajarCategoriesList {
    return najarCategoriesList;
  }

  ///////// Electric ////////////////////
  List<CategoriesModel> electricList = [];
  CategoriesModel electricModel;

  Future<void> getelectric() async {
    List<CategoriesModel> newelectricList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('كهربائي')
        .get();
    querySnapshot.docs.forEach((element) {
      electricModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newelectricList.add(electricModel);
      electricList = newelectricList;
    });
    notifyListeners();
  }

  get throwelectricList {
    return electricList;
  }

  ///////////// electrica categories list //////////
  List<insideCategoriesModle> electricCategoriesList = [];
  insideCategoriesModle electricCategoriesModle;

  Future<void> getelectricCategorieList() async {
    List<insideCategoriesModle> newelectricCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('كهربائي')
        .get();
    querySnapshot.docs.forEach((element) {
      electricCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newelectricCategoriesList.add(electricCategoriesModle);
      electricCategoriesList = newelectricCategoriesList;
    });

    notifyListeners();
  }

  get thrownelectricCategoriesList {
    return electricCategoriesList;
  }

/////////Marble////////////////

  List<CategoriesModel> MarbleList = [];
  CategoriesModel MarbleModel;

  Future<void> getMarble() async {
    List<CategoriesModel> newMarbleList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('رخام')
        .get();
    querySnapshot.docs.forEach((element) {
      MarbleModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newMarbleList.add(MarbleModel);
      MarbleList = newMarbleList;
    });
    notifyListeners();
  }

  get throwMarbleList {
    return MarbleList;
  }

  /////////////  Marble categories list //////////
  List<insideCategoriesModle> MarbleCategoriesList = [];
  insideCategoriesModle MarbleCategoriesModle;

  Future<void> getMarbleCategorieList() async {
    List<insideCategoriesModle> newMarbleCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('رخام')
        .get();
    querySnapshot.docs.forEach((element) {
      MarbleCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newMarbleCategoriesList.add(MarbleCategoriesModle);
      MarbleCategoriesList = newMarbleCategoriesList;
    });

    notifyListeners();
  }

  get throwMarbleCategoriesList {
    return MarbleCategoriesList;
  }
  /////////TCC////////////////

  List<CategoriesModel> TCCList = [];
  CategoriesModel TCCModel;

  Future<void> getTCC() async {
    List<CategoriesModel> newTCCList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('فني تكييفات والتبريد')
        .get();
    querySnapshot.docs.forEach((element) {
      TCCModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newTCCList.add(TCCModel);
      TCCList = newTCCList;
    });
    notifyListeners();
  }

  get throwTCCList {
    return TCCList;
  }

  ///////////// TCC categories list //////////
  List<insideCategoriesModle> TCCCategoriesList = [];
  insideCategoriesModle TCCCategoriesModle;

  Future<void> getTCCCategorieList() async {
    List<insideCategoriesModle> newTCCCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('فني تكييفات والتبريد')
        .get();
    querySnapshot.docs.forEach((element) {
      TCCCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newTCCCategoriesList.add(TCCCategoriesModle);
      TCCCategoriesList = newTCCCategoriesList;
    });

    notifyListeners();
  }

  get throwTCCCategoriesList {
    return TCCCategoriesList;
  }
  /////////Montal////////////////

  List<CategoriesModel> MontalList = [];
  CategoriesModel MontalModel;

  Future<void> getMontal() async {
    List<CategoriesModel> newMontallist = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('Aluminium')
        .get();
    querySnapshot.docs.forEach((element) {
      MontalModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newMontallist.add(MontalModel);
      MontalList = newMontallist;
    });
    notifyListeners();
  }

  get throwmontalList {
    return MontalList;
  }

  ///////////// Montal categories list //////////
  List<insideCategoriesModle> MontalCategoriesList = [];
  insideCategoriesModle MontalategoriesModle;

  Future<void> getMontalCategorieList() async {
    List<insideCategoriesModle> newMontalCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('Aluminium')
        .get();
    querySnapshot.docs.forEach((element) {
      MontalategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newMontalCategoriesList.add(MontalategoriesModle);
      MontalCategoriesList = newMontalCategoriesList;
    });

    notifyListeners();
  }

  get throwMontalCategoriesList {
    return MontalCategoriesList;
  }
  /////////Ceramic tiled////////////////

  List<CategoriesModel> CTList = [];
  CategoriesModel CTModel;

  Future<void> getCT() async {
    List<CategoriesModel> newCTList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('مبلط سيراميك')
        .get();
    querySnapshot.docs.forEach((element) {
      CTModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],

      );
      //  print(categoriesModel.name);
      newCTList.add(CTModel);
      CTList = newCTList;
    });
    notifyListeners();
  }

  get throwCTList {
    return CTList;
  }

  ///////////// CT categories list //////////
  List<insideCategoriesModle> CTCategoriesList = [];
  insideCategoriesModle CTCategoriesModle;

  Future<void> getCTCCategorieList() async {
    List<insideCategoriesModle> newCTCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('مبلط سيراميك')
        .get();
    querySnapshot.docs.forEach((element) {
      CTCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newCTCategoriesList.add(CTCategoriesModle);
      CTCategoriesList = newCTCategoriesList;
    });

    notifyListeners();
  }

  get throwCTategoriesList {
    return CTCategoriesList;
  }
  /////////Gypsum and décor////////////////

  List<CategoriesModel> GDList = [];
  CategoriesModel GDModel;

  Future<void> getGD() async {
    List<CategoriesModel> newGDList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('فني جبس وديكور')
        .get();
    querySnapshot.docs.forEach((element) {
      GDModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newGDList.add(GDModel);
      GDList = newGDList;
    });
    notifyListeners();
  }

  get throwGDList {
    return GDList;
  }

  ///////////// Gypsum and décor //////////
  List<insideCategoriesModle> GDCategoriesList = [];
  insideCategoriesModle GDCategoriesModle;

  Future<void> getGDCCategorieList() async {
    List<insideCategoriesModle> newGDCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('فني جبس وديكور')
        .get();
    querySnapshot.docs.forEach((element) {
      GDCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );

      newGDCategoriesList.add(GDCategoriesModle);
      GDCategoriesList = newGDCategoriesList;
    });

    notifyListeners();
  }

  get throwGDategoriesList {
    return GDCategoriesList;
  }
  /////////Haddad////////////////

  List<CategoriesModel> HadList = [];
  CategoriesModel HadModel;

  Future<void> getHad() async {
    List<CategoriesModel> newHadList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('UoYZ4koeXWxu4ph8NBg5')
        .collection('حداد')
        .get();
    querySnapshot.docs.forEach((element) {
      HadModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      //  print(categoriesModel.name);
      newHadList.add(HadModel);
      HadList = newHadList;
    });
    notifyListeners();
  }

  get throwHadList {
    return HadList;
  }

  ///////////// Haddad //////////
  List<insideCategoriesModle> HadCategoriesList = [];
  insideCategoriesModle HadCategoriesModle;

  Future<void> getHadCategorieList() async {
    List<insideCategoriesModle> newHadCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('insidecategorties')
        .doc('9vzOS1wTA822C4682Ds2')
        .collection('حداد')
        .get();
    querySnapshot.docs.forEach((element) {
      HadCategoriesModle = insideCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        descrption: element.data()['descrption'],
        imagedc: element.data()['imagedc'],
        number: element.data()['number'],
      );
      newHadCategoriesList.add(HadCategoriesModle);
      HadCategoriesList = newHadCategoriesList;
    });

    notifyListeners();
  }

  get throwHadDategoriesList {
    return HadCategoriesList;
  }
}
