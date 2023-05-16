import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/productdetails/priceandcount.dart';
import 'package:ecommercecourse/view/widget/productdetails/subitemslist.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    cartcontroller  Cartcontroller =
    Get.put(cartcontroller());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Cartcontroller.refreshpageee();
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest,
              widget:ListView(children: [
                const TopProductPageDetails(),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text("${controller.itemsModel.itemsName}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColor.fourthColor,
                        )),
                    const SizedBox(height: 10),
                    PriceAndCountItems(
                        onAdd: () {
                          controller.add();
                        },

                        onRemove: () {
                          controller.remove();
                        },

                        price: "${controller.itemsModel.itemsPrice}", count: "${controller.countitems}"),
                    const SizedBox(height: 10),
                    Text(
                        "${controller.itemsModel.itemsDescArabic} ${controller.itemsModel.itemsDescArabic} ${controller.itemsModel.itemsDescArabic} ${controller.itemsModel.itemsDescArabic} ${controller.itemsModel.itemsDescArabic}",
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(height: 10),
                    Text("Color",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColor.fourthColor,
                        )),
                    const SizedBox(height: 10),
                    const SubitemsList()
                  ]),
                )
              ])


          ),
        ));
  }
}
