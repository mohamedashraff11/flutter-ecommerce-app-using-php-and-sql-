import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:ecommercecourse/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommercecourse/data/model/myfavorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class myfavoritecontroller extends GetxController{
  myfavoritedata favoriteData =myfavoritedata(Get.find());
  List<MyFavoriteModel> data= [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();



  getData()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.viewfavorite(myServices.sharedPreferences.getInt("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
       List responsedata = response['data'];
       data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deletefromfavorite(int favoriteid)async{
    data.clear();
    var response = await favoriteData.deletefavorite(favoriteid);

      data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }
@override
  void onInit() {
    getData();
    super.onInit();
  }

}
