class ProviderCardModel {
  String name;
  String phone;
  int servicePrice;
  int ratCount;
  dynamic ratSum;
  String long;
  String lat;
  int providerId;
  double distance;

  ProviderCardModel({
    this.name,
    this.phone,
    this.servicePrice,
    this.ratCount,
    this.ratSum,
    this.long,
    this.lat,
    this.providerId,
    this.distance,
  });

  factory ProviderCardModel.fromApi(Map<String, dynamic> json) {
    return ProviderCardModel(
      name: json["name"],
      phone: json["phone"],
      servicePrice: json["service_price"],
      ratCount: json["rat_count"],
      ratSum: json["rat_sum"],
      long: json["long"],
      lat: json["lat"],
      providerId: json["provider_id"],
      distance: json["distance"].toDouble(),
    );
  }
}
