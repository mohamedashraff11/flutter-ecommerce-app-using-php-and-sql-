import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/cart/bottoncart.dart';
import 'package:ecommercecourse/view/widget/cart/customitemcartlist.dart';
import 'package:ecommercecourse/view/widget/cart/topcardcart.dart';
import 'package:ecommercecourse/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cartcontroller  Cartcontroller= Get.put(cartcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      bottomNavigationBar:GetBuilder<cartcontroller>(builder: ((controller)=>HandlingDataView(statusRequest: controller.statusRequest,
          widget: BottomNavgationBarCart(price: '${Cartcontroller.priceorders}', shipping: '${Cartcontroller.discountcoupon}', totalprice: '${Cartcontroller.getTotalPrice()}',onapplycoupon: (){controller.checkcoupon();}, controllercoupon: controller.controllercoupon!,),)),),
      body: GetBuilder<cartcontroller>(
        builder: ((controller)=>HandlingDataView(statusRequest: controller.statusRequest,
            widget:ListView(
              children: [
                Container(
                  child: Center(child: Text('cart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
                topcardcart(itemscount: '${Cartcontroller.totalcountitems}',),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        Cartcontroller.data.length,
                            (index) => customitemcartlist(
                              name: '${Cartcontroller.data[index].itemsName}',
                              price: '${Cartcontroller.data[index].itemsPrice}',count: '${Cartcontroller.data[index].countitems}',
                              image: '${Cartcontroller.data[index].itemsImage}',
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),

        )),
      ),
    );
  }
}

