import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class myfavoritedata {
  Crud crud;
  myfavoritedata(this.crud);
  viewfavorite(int id) async {
    var response = await crud.postData(AppLink.favoriteView, {'id':id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deletefavorite(int id) async {
    var response = await crud.postData(AppLink.deletefromfavroite, {'id':id.toString()});
    return response.fold((l) => l, (r) => r);
  }

}