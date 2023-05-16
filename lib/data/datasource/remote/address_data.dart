import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(int usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(int usersid, String name, String city, String street, double lat,
      double long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid.toString(),
      "name": name,
      "city": city,
      "street": street,
      "lat": lat.toString(),
      "long": long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"addressid": addressid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
