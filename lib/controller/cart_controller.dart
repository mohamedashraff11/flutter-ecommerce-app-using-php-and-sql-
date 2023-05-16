import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:ecommercecourse/data/model/couponmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class cartcontroller extends GetxController{
  cartdata testData =cartdata(Get.find());
  TextEditingController ? controllercoupon;
  List<CartModel> data= [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int? discountcoupon =0;
  String? couponname;

  int? priceorders=0;
  int ?totalcountitems=0;
  CouponModel? couponmodel;


  addcart(int itemid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.addcart(myServices.sharedPreferences.getInt("id")!, itemid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title:'notification' ,messageText:Text('done') ,);
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  deletecart(int itemid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.deletecart(myServices.sharedPreferences.getInt("id")!, itemid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title:'notification' ,messageText:Text('done') ,);
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getcartcount(int itemid)async{
  data.clear();
  statusRequest = StatusRequest.loading;
  var response = await testData.getcountcart(myServices.sharedPreferences.getInt("id")!, itemid);
  print("=============================== Controller $response ");
  statusRequest = handlingData(response);
  if (StatusRequest.success == statusRequest) {
  // Start backend
  if (response['status'] == "success") {
  Get.rawSnackbar(title:'notification' ,messageText:Text('done') ,);
         int countitems=0;
         countitems=response['data'];
         print('====================================');
         print(countitems);
         return countitems;
  } else {
  statusRequest = StatusRequest.failure;
  }
  // End
  }
  update();
}

  viewcart()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.viewcart(myServices.sharedPreferences.getInt("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
       List dataresponse=response['datacart'];
       Map dataresponsecountprice=response['countprice'];
       data.clear();
       print('$dataresponsecountprice');
       data.addAll(dataresponse.map((e) =>CartModel.fromJson(e) ));
      totalcountitems= dataresponsecountprice['totalcount'];
      print('$totalcountitems');
      priceorders = dataresponsecountprice['totalprice'];
      print('$priceorders');
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  resetpagee(){
    totalcountitems=0;
    priceorders=0;
    data.clear();
  }
  refreshpageee(){
    resetpagee();
    viewcart()  ;
  }


  // checkcoupon()async{
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await testData.checkcoupon(controllercoupon!.text);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Map<String,dynamic> datacoupon =response['data'];
  //       couponmodel =CouponModel.fromJson(datacoupon);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await testData.checkcoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponmodel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponmodel!.couponDiscount ;
        couponname = couponmodel!.couponName ;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0 ;
        couponname = null ;

      }
      // End
    }
    update();
  }
  getTotalPrice(){
    return (priceorders! - priceorders! * discountcoupon! / 100 )   ;
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    viewcart();
    super.onInit();
  }

}