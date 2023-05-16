import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {

  cartcontroller Cartcontroller=Get.put(cartcontroller());

  late StatusRequest statusRequest;

  late ItemsModel itemsModel;
  int  countitems=0;
  intialData() async{
    statusRequest=StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems= await Cartcontroller.getcartcount(itemsModel.itemsId!);
    statusRequest=StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add(){
    Cartcontroller.addcart(itemsModel.itemsId!);
    countitems++;
    update();
  }
  remove(){
    Cartcontroller.deletecart(itemsModel.itemsId!);
    if(countitems > 0){
      countitems--;
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
