import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  CustomListItems( {Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         controller.goToPageProductDetails(itemsModel)  ; 
      },
        child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag:"${itemsModel.itemsId}" ,
                child: CachedNetworkImage(
                  imageUrl:  itemsModel.itemsImage!,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10) , 
              Text(translateDatabase(itemsModel.itemsNameArabic, itemsModel.itemsName),
                  style:const TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Rating 3.5 ", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) =>const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.itemsPrice} \$",
                      style:const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans")),
                  GetBuilder<favoritecontroller>(
                      builder:(controller)=>IconButton(
                          onPressed: () {
                            if(controller.isfavorite[itemsModel.itemsId]==1){
                              controller.setfavorite(itemsModel.itemsId,0);
                              controller.deletefavorite(itemsModel.itemsId!);
                            }else{
                              controller.setfavorite(itemsModel.itemsId, 1);
                              controller.addfavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isfavorite[itemsModel.itemsId]==1?
                           Icons.favorite:Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ))

                  )
                ],
              )
            ]),
      ),
    ));
  }
}
