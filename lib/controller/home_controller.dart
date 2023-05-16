import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  List<ItemsModel>listdata=[];
  bool issearch=false;
  String? username;
  int? id;
  String? lang;
  TextEditingController ? Search;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  // List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    Search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  searchdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(Search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       List responsedata=response['data'];
       listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }
  checksearch(val){
    if(val==''){
    issearch=false;
    }
    update();
  }
  onsearchitems(){
    issearch=true;
    update();
  }
}
