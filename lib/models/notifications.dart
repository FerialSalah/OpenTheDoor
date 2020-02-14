class Generalnotfication {
  int id;
  String notTitleAr;
  String notTitleEn;
  String notLink;
  String createdAt;
  String updatedAt;

  Generalnotfication(
      {this.id,
      this.notTitleAr,
      this.notTitleEn,
      this.notLink,
      this.createdAt,
      this.updatedAt});

  Generalnotfication.fromApi(Map<String, dynamic> json) {
    id = json['id'];
    notTitleAr = json['not_title_ar'];
    notTitleEn = json['not_title_en'];
    notLink = json['not_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
