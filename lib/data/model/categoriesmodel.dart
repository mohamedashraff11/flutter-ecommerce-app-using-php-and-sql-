class CategoriesModel {
int? catigoriesId;
String? catigoriesName;
String? catigoriesNameArabic;
String? catigoriesDatetime;
String? catigoriesImages;

CategoriesModel(
{this.catigoriesId,
this.catigoriesName,
this.catigoriesNameArabic,
this.catigoriesDatetime,
this.catigoriesImages});

CategoriesModel.fromJson(Map<String, dynamic> json) {
catigoriesId = json['catigories_id'];
catigoriesName = json['catigories_name'];
catigoriesNameArabic = json['catigories_name_arabic'];
catigoriesDatetime = json['catigories_datetime'];
catigoriesImages = json['catigories_images'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['catigories_id'] = this.catigoriesId;
data['catigories_name'] = this.catigoriesName;
data['catigories_name_arabic'] = this.catigoriesNameArabic;
data['catigories_datetime'] = this.catigoriesDatetime;
data['catigories_images'] = this.catigoriesImages;
return data;
}
}