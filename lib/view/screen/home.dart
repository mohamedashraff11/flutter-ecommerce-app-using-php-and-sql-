import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customcardhome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    CustomAppBar(
                      onchange: (val){
                        controller.checksearch(val);
                      },
                         mycontroller: controller.Search!,
                        titleappbar: "Find Product",
                        onPressedIcon: () {},
                        onPressedSearch: () {
                        controller.onsearchitems();
                        },
                      onPressedfavorite: () {
                          Get.toNamed(AppRoute.myfavroite);
                      },

                    ),

                    Column(
                      children: [
                         CustomCardHome(
                            title: "A summer surprise", body: "Cashback 20%"),
                        CustomTitleHome(title: "Categories"),
                        ListCategoriesHome(),
                        CustomTitleHome(title: "Product for you"),
                        ListItemsHome(),
                      ],
                    )



                    // const CustomTitleHome(title: "Offer"),
                    // const ListItemsHome()
                  ],
                )
            )));
  }

}
class ListItemSearch extends StatelessWidget {
  final List<ItemsModel>listdatamodel;
  const ListItemSearch({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)
         {
           return Text('${listdatamodel[index].itemsName}');
         });
  }
}


