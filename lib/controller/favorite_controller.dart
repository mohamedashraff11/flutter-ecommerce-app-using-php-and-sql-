import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class favoritecontroller extends GetxController{
  favoritedata testData =favoritedata(Get.find());
  Map isfavorite = {};
  List data= [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  setfavorite(id,val){
    isfavorite[id]=val;
    update();
  }


  addfavorite(int itemid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.addfavorite(myServices.sharedPreferences.getInt("id")!, itemid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title:'notification' ,messageText:Text('done') ,);
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }



  deletefavorite(int itemid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.deletefavorite(myServices.sharedPreferences.getInt("id")!, itemid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title:'notification' ,messageText:Text('done') ,);
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


}