import 'package:ecommercecourse/controller/checkout_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommercecourse/view/widget/checkout/checkoutlistile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/checkout/cardpaymentmethodcheckout.dart';

class checkout  extends StatelessWidget {
  const checkout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller=Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: GetBuilder<CheckoutController>(builder: (context)=>HandlingDataView(statusRequest: controller.statusRequest,
          widget: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Text('Choose Payment Method',
                    style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                  InkWell(onTap: (){
                    controller.choosePaymentMethod('cash');
                  },
                      child: cardpaymentmethodcheckout(title: 'Cash', isactive:controller.paymentMethod=='cash'?true: false,)),
                  InkWell(
                      onTap: (){
                        controller.choosePaymentMethod('Payment Card');
                      },
                      child: cardpaymentmethodcheckout(title: 'Payment Card', isactive:controller.paymentMethod=='Payment Card'?true: false,)),
                  SizedBox(height: 15,),
                  Text('Choose Delivery Type',
                    style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            controller.chooseDeliveryType('Delivery');
                          },
                          child: carddeliverytype(imagepath: 'assets/images/005-delivery-man.png', title: 'Delivery', isactive:controller.deliveryType=='Delivery'? true:false,)),
                      SizedBox(width: 15,),
                      InkWell(
                          onTap: (){
                            controller.chooseDeliveryType('Drive thru');
                          },
                          child: carddeliverytype(imagepath: 'assets/images/drivethru.png', title: 'Drive thru',  isactive:controller.deliveryType=='Drive thru'? true:false,)),
                    ],
                  ),
                  SizedBox(height: 16,),
                  controller.deliveryType=='Delivery'?
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Shipping Address',
                      style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                    ...List.generate(
                     controller.dataaddress.length,(index)=>InkWell(
                        onTap: (){
                          controller.chooseShippingAddress('${controller.dataaddress[index].addressName}');
                        },
                        child: checkoutlistile(title: '${controller.dataaddress[index].addressName}', subtitle: '${controller.dataaddress[index].addressStreet}', isactive: controller.addressname==controller.dataaddress[index].addressName?true:false,))
                    ),

                  ],):Container(height: 190,),

                  Container(
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 19),),
                    )),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ],
              ),
            ),
          )),),
    );
  }
}
