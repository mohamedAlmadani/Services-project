import 'package:app03/backend/myprovider.dart';
import 'package:app03/backend/server.dart';
import 'package:app03/model/CategoriesModel.dart';
import 'package:app03/model/insidecategoriesModel.dart';
import 'package:app03/ui/screen/deatails.dart';
import 'package:app03/ui/widgets/categoriesContainer.dart';
import 'package:app03/ui/widgets/drawer_custom.dart';
import 'package:app03/ui/widgets/insideCategories.dart';
import 'package:app03/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  List<CategoriesModel> najarList = [];
  List<insideCategoriesModle> najarCategoriesList = [];
  List<CategoriesModel> electricList = [];
  List<insideCategoriesModle> electricCategoriesList = [];
  List<CategoriesModel> MarbleList = [];
  List<insideCategoriesModle> MarbleCategoriesList = [];
  List<CategoriesModel> TCCList = [];
  List<insideCategoriesModle> TCCCategoriesList = [];
  List<CategoriesModel> MontalList = [];
  List<insideCategoriesModle> MontalCategoriesList = [];
  List<CategoriesModel> CTList = [];
  List<insideCategoriesModle> CTCategoriesList = [];
  List<CategoriesModel> GDList = [];
  List<insideCategoriesModle> GDCategoriesList = [];
  List<CategoriesModel> HadList = [];
  List<insideCategoriesModle> HadCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    myProvider provider = Provider.of<myProvider>(context);
    provider.getNajar();
    provider.getelectric();
    provider.getnajarCategorieList();
    provider.getelectric();
    provider.getelectricCategorieList();
    provider.getMarble();
    provider.getMarbleCategorieList();
    provider.getTCC();
    provider.getTCCCategorieList();
    provider.getMontal();
    provider.getMontalCategorieList();
    provider.getCT();
    provider.getCTCCategorieList();
    provider.getGD();
    provider.getGDCCategorieList();
    provider.getHad();
    provider.getHadCategorieList();

    ///////////////////////////////////
    najarList = provider.thrownajarList;
    najarCategoriesList = provider.thrownajarCategoriesList;
    electricList = provider.throwelectricList;
    electricCategoriesList = provider.thrownelectricCategoriesList;
    MarbleList = provider.throwMarbleList;
    MarbleCategoriesList = provider.throwMarbleCategoriesList;
    TCCList = provider.throwTCCList;
    TCCCategoriesList = provider.throwTCCCategoriesList;
    MontalList = provider.throwmontalList;
    MontalCategoriesList = provider.throwMontalCategoriesList;
    CTList = provider.throwCTList;
    CTCategoriesList = provider.throwCTategoriesList;
    GDList = provider.throwGDList;
    GDCategoriesList = provider.throwGDategoriesList;
    HadList = provider.throwHadList;
    HadCategoriesList = provider.throwHadDategoriesList;

    return Scaffold(
        endDrawer: drawerCustom(),
        appBar: AppBar(
          title: Text('الصفحة الرئيسية'),
          centerTitle: true,
          backgroundColor: appbar,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(22),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 125.w),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Transform.translate(
                      offset: Offset(110.w,-1.h),
                      child: Text(
                        'فئات الحرفين:',

                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  nujar(),
                  SizedBox(
                    height: 20.h,
                  ),
                  electrician(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Marble(),
                  SizedBox(
                    height: 20.h,
                  ),
                  TCC(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CT(),
                  SizedBox(
                    height: 20.h,
                  ),
                  GD(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Haddad(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Montal(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget nujar() {
    return Row(
      children: najarList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Get.to(insideCategories(
                  list: najarCategoriesList,
                ));
              }))
          .toList(),
    );
  }

  Widget electrician() {
    return Row(
      children: electricList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Get.to(insideCategories(
                  list: electricCategoriesList,
                ));
              }))
          .toList(),
    );
  }

  Widget Marble() {
    return Row(
      children: MarbleList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: MarbleCategoriesList,
            ));
          })).toList(),
    );
  }

  Widget TCC() {
    return Row(
      children: TCCList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: TCCCategoriesList,
            ));
          })).toList(),
    );
  }

  Widget Montal() {
    return Row(
      children: MontalList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: MontalCategoriesList,
            ));
          })).toList(),
    );
  }

  Widget CT() {
    return Row(
      children: CTList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: CTCategoriesList,
            ));
          })).toList(),
    );
  }

  Widget GD() {
    return Row(
      children: GDList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: GDCategoriesList,
            ));
          })).toList(),
    );
  }

  Widget Haddad() {
    return Row(
      children: HadList.map((e) => categoriesContainer(
          image: e.image ?? '',
          name: e.name ?? '',
          onTap: () {
            Get.to(insideCategories(
              list: HadCategoriesList,
            ));
          })).toList(),
    );
  }
}
