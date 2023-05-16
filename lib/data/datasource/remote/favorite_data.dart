import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class favoritedata {
  Crud crud;
  favoritedata(this.crud);
  addfavorite(int userid,int itemsid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {"usersid" : userid.toString(),"itemsid" : itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  deletefavorite(int userid,int itemsid) async {
    var response = await crud.postData(AppLink.favoriteRemove, {"usersid" : userid.toString(),"itemsid" : itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
