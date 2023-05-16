import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class cartdata {
  Crud crud;
  cartdata(this.crud);
  addcart(int userid,int itemsid) async {
    var response = await crud.postData(AppLink.cartadd, {"usersid" : userid.toString(),"itemsid" : itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deletecart(int userid,int itemsid) async {
    var response = await crud.postData(AppLink.cartdelete, {"usersid" : userid.toString(),"itemsid" : itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getcountcart(int userid,int itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {"usersid" : userid.toString(),"itemsid" : itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewcart(int userid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid" : userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String couponname) async {
    var response = await crud.postData(AppLink.checkcoupon, {"couponname" : couponname});
    return response.fold((l) => l, (r) => r);
  }

}