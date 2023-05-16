// ignore_for_file: prefer_const_constructors

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/cheakout.dart';
import 'package:ecommercecourse/view/widget/language/custombuttomlang.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/routes.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price ;
  final String shipping ;
  final String totalprice ;
  final TextEditingController controllercoupon;
  final void Function()? onapplycoupon ;
  const BottomNavgationBarCart({Key? key, required this.price, required this.shipping, required this.totalprice, this.onapplycoupon, required this.controllercoupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                     children: [
                       Expanded(
                         flex: 2,
                           child: TextFormField(
                             controller:controllercoupon,
                             decoration: InputDecoration(
                               isDense: true,
                               contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                 hintText: 'Coupon Code',
                               border: OutlineInputBorder()
                             ),
                           )),
                       SizedBox(width: 6,),
                       Expanded(
                         flex: 1,
                         child: InkWell(
                           onTap: onapplycoupon,
                           child: Container(
                             decoration: BoxDecoration(
                                 color: AppColor.primaryColor,
                               borderRadius: BorderRadius.circular(10)
                             ),
                             height: 35,

                             child: Padding(
                               padding: const EdgeInsets.only(bottom: 8.0),
                               child: Center(child: Text('apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                             ),
                           ),
                         ),
                       )
                     ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("price", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$price \$", style: TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("discount", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping \%", style: TextStyle(fontSize: 16)))
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \$",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)))
              ],
            ),
            SizedBox(height: 10),
            CustomButtonLang(textbutton: 'place order',onPressed: (){
              Get.toNamed(AppRoute.checkout);
            },)
          ],
        ));
  }
}
