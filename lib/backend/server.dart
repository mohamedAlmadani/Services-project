import 'package:app03/backend/AppGet.dart';
import 'package:app03/backend/Repository.dart';
import 'package:app03/backend/myprovider.dart';
import 'package:app03/model/AppUser.dart';
import 'package:app03/model/MessageMode.dart';
import 'package:app03/ui/screen/deatails.dart';
import 'package:app03/ui/screen/home.dart';
import 'package:app03/ui/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;
AppGet appGet = Get.find();
FirebaseFirestore firestore = FirebaseFirestore.instance;
final String collectionName = 'Users';
String chatCollectionName = 'chats';
String messageCollectionName = 'messages';

final postsRef = FirebaseFirestore.instance.collection('posts');
final commentsRef = FirebaseFirestore.instance.collection('comments');
final postRef = FirebaseFirestore.instance.collection('post');

final activityFeedRef = FirebaseFirestore.instance.collection('feed');
final followersRef = FirebaseFirestore.instance.collection('followers');
final followingRef = FirebaseFirestore.instance.collection('following');
final timelineRef = FirebaseFirestore.instance.collection('timeline');
 DateTime timestamps = DateTime.now();
String userId;
addcomment(Map map) async{
  String insideId;
  CollectionReference collectionReference = await  commentsRef;
  collectionReference.add({...map});
//  Get.to(NewsPage());
}
addpost(Map map) async{
  CollectionReference collectionReference = await  postRef;
  collectionReference.add({...map});
}



Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user.uid;
  } on Exception catch (e) {
    return null;
  }
}

String getUserId() {
  String userId = auth.currentUser != null ? auth.currentUser.uid : null;
  return userId;
}

signOut() async {
  await auth.signOut();
  //SPHelper.spHelper.clearData();
  Get.off(Login());
}

saveUserInFirebase(Map map) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(map['Email'], map['password']);
    print('uderid :$userId');

    map.remove('password');
    map['userId'] = userId;

    await firestore.collection(collectionName).doc(userId).set({...map});
    AppUser appUser = AppUser.fromMap(map);
    Repository.repository.appUser = appUser;
    appGet.setUserModel(appUser);
    Get.off(HomeScreen());
  } on Exception catch (e) {
    print(e);
  }
}
fetchSplachData() async {
  AppUser appUser = await getUserFromFirebase();
  Repository.repository.appUser = appUser;
}

signInUsingEmailAndPassword(String email, String password) async {
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();
  Map map = documentSnapshot.data();

  map['userId'] = documentSnapshot.id;

  AppUser appUser = AppUser.fromMap(map);
  Repository.repository.appUser = appUser;
  //SPHelper.spHelper.saveUser(appUser);
  appUser.userId = userCredential.user.uid;
  Get.off(HomeScreen());
}

addStar(Map map) async {
  String userId = getUserId();
  await firestore
      .collection(collectionName)
      .doc(userId)
      .collection('evaluate')
      .add({...map});
}


splachMethods() {
  getAlUsers();
}
Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();
  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;
  print('userId:$userId');
  AppUser appUser = AppUser.fromMap(map);
  appGet.setUserModel(appUser);
  Repository.repository.appUser = appUser;
  //SPHelper.spHelper.saveUser(appUser);
  appGet.setUserModel(appUser);

  return appUser;
}



addContactUs(Map map) async {
  CollectionReference collectionReference =
      await firestore.collection('ContactUs');
  collectionReference.add({...map});
//  Get.to(NewsPage());
}

Future<String> createChat(List<String> usersIds) async {
  String chatId = usersIds.reduce((value, element) {
    print(value);
    print(element);
 //   Logger().d("value: $value  element $element");
    return (value+element);
  } );
  //String chatId1 = ""
  // var _uuid = Uuid().v4() ;

  await firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .set({'users': usersIds});
  return chatId;
}

createMessage(MessageMode message) async {
  firestore
      .collection(chatCollectionName)
      .doc(message.chatId)
      .collection(messageCollectionName)
      .add(message.toJson());
}
getAlUsers() async {
  QuerySnapshot querySnapshot =
  await firestore.collection(collectionName).get();
  List<AppUser> appUser =
  querySnapshot.docs.map((e) => AppUser.fromMap(e.data())).toList();
  appGet.users. value= appUser
      .where((element) => element.userId != appGet.appUser?.userId)
      .toList();



}

Future<List<Map<String,dynamic>>>getAllChats() async {
  String myId =appGet.appUser.userId;
  QuerySnapshot querySnapshot=await firestore.collection(chatCollectionName).where('user',arrayContains: myId).get();
  List<Map<String, dynamic>> chats =querySnapshot.docs.map((e) => e.data()).toList();
  return chats;

}
Stream<QuerySnapshot>getChatMessages(String chatId )  {
  Stream<QuerySnapshot> stream = firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .collection(messageCollectionName)
      .orderBy('timeStamp')
      .snapshots();
  return stream;
}


