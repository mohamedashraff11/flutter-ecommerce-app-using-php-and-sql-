import 'package:ecommercecourse/controller/myfavorite.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/myfavorite/customlistfavoriteitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myfavorite extends StatelessWidget {
  const myfavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(myfavoritecontroller());
    return Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GetBuilder<myfavoritecontroller>(
              builder: ((controller)=>
                  ListView(
                children: [
                  CustomAppBar(titleappbar: '',
                      onPressedIcon: (){},
                      onPressedSearch: (){},
                      onPressedfavorite: (){}),
                  HandlingDataView(statusRequest: controller.statusRequest,
                      widget:  GridView.builder(
                          itemCount: controller.data.length,
                          shrinkWrap: true,
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (context,index){
                        return CustomListFavoriteItems(itemsModel: controller.data[index]);
                          })

                  )
                ],
              )

              ),
            )
          ),
        ),
    );
  }
}
