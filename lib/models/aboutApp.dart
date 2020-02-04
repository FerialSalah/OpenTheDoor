class AboutUsModel {
  String contentAr;
  String contentEn;

  AboutUsModel({
    this.contentAr,
    this.contentEn,
  });

  factory AboutUsModel.fromApi(Map<String, dynamic> json) {
    return AboutUsModel(
      contentAr: json["content_ar"],
      contentEn: json["content_en"],
    );
  }
}
