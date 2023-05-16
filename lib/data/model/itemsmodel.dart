class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameArabic;
  String? itemsDescArabic;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? catigoriesId;
  String? catigoriesName;
  String? catigoriesNameArabic;
  String? catigoriesDatetime;
  int? favorite;
  int? itemspricedisount;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameArabic,
        this.itemsDescArabic,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.catigoriesId,
        this.catigoriesName,
        this.catigoriesNameArabic,
        this.catigoriesDatetime,
        this.favorite,
        this.itemspricedisount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameArabic = json['items_name_arabic'];
    itemsDescArabic = json['items_desc_arabic'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    catigoriesId = json['catigories_id'];
    catigoriesName = json['catigories_name'];
    catigoriesNameArabic = json['catigories_name_arabic'];
    catigoriesDatetime = json['catigories_datetime'];
    favorite = json['favorite'];
    itemspricedisount = json['itemspricedisount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_arabic'] = this.itemsNameArabic;
    data['items_desc_arabic'] = this.itemsDescArabic;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['catigories_id'] = this.catigoriesId;
    data['catigories_name'] = this.catigoriesName;
    data['catigories_name_arabic'] = this.catigoriesNameArabic;
    data['catigories_datetime'] = this.catigoriesDatetime;
    data['favorite'] = this.favorite;
    data['itemspricedisount'] = this.itemspricedisount;
    return data;
  }
}