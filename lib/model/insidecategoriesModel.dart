import 'package:flutter/material.dart';
class insideCategoriesModle{
  String name;
  String number;
  String descrption;
  String imagedc;
  String image;
  String userId;
  String insideId;

  insideCategoriesModle({this.name,this.image,this.descrption,this.imagedc,this.number});
  insideCategoriesModle.fromMap(Map map){

    this.name=map['name'];
    this.image=map['image'];
    this.userId=map['userId'];
    this.insideId=map['insideId'];
    this.number=map['number'];
    this.imagedc=map['imagedc'];
    this.descrption=map['descrption'];

  }
  toJson(){
    return {

      'image':this.image,
      'name':this.name,
      'userId':this.userId,
      'insideId':this.insideId,
      'number':this.number,
      'imagedc':this.imagedc,
      'descrption':this.descrption






    };
  }

}