class AppContactModel {
  String phone;
  String email;
  String addressAr;
  String addressEn;
  String url;

  AppContactModel({
    this.phone,
    this.email,
    this.addressAr,
    this.addressEn,
    this.url,
  });

  factory AppContactModel.fromApi(Map<String, dynamic> json) {
    return AppContactModel(
      phone: json["website_phone"],
      email: json["website_email"],
      addressAr: json["website_address_ar"],
      addressEn: json["website_address_en"],
      url: json["website_url"],
    );
  }


}
