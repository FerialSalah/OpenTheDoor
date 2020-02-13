class ServiceDetailsModel {
  int id;
  int providerPricePerHour;
  int providerMinutesToArrive;
  int providerHourToFinish;
  dynamic bounce;
  int costOfServiceProvider;
  int couponId;
  int couponValue;
  int serviceId;
  int total;
  int watch;
  int userId;
  String status;
  String paymentMethod;
  int providerId;
  DateTime scheduleTime;
  String notes;
  String providerLong;
  String providerLat;
  String userLong;
  String userLat;
  int acceptProvider;
  int therest;
  int providerStart;
  DateTime createdAt;
  DateTime updatedAt;
  String providerName;
  String userName;
  String userPhone;
  String userImage;
  String userEmail;
  String serviceNameAr;
  String serviceNameEn;
  int ratCount;
  dynamic ratSum;
  String providerPhone;
  String providerEmail;
  String providerImage;

  ServiceDetailsModel({
    this.id,
    this.providerPricePerHour,
    this.providerMinutesToArrive,
    this.providerHourToFinish,
    this.bounce,
    this.costOfServiceProvider,
    this.couponId,
    this.couponValue,
    this.serviceId,
    this.total,
    this.watch,
    this.userId,
    this.status,
    this.paymentMethod,
    this.providerId,
    this.scheduleTime,
    this.notes,
    this.providerLong,
    this.providerLat,
    this.userLong,
    this.userLat,
    this.acceptProvider,
    this.therest,
    this.providerStart,
    this.createdAt,
    this.updatedAt,
    this.providerName,
    this.userName,
    this.userPhone,
    this.userImage,
    this.userEmail,
    this.serviceNameAr,
    this.serviceNameEn,
    this.ratCount,
    this.ratSum,
    this.providerPhone,
    this.providerEmail,
    this.providerImage,
  });

  factory ServiceDetailsModel.fromApi(Map<String, dynamic> json) {
    return ServiceDetailsModel(
      id: json["id"],
      providerPricePerHour: json["provider_price_per_hour"],
      providerMinutesToArrive: json["provider_minutes_to_arrive"],
      providerHourToFinish: json["provider_hour_to_finish"],
      bounce: json["bounce"],
      costOfServiceProvider: json["cost_of_service_provider"],
      couponId: json["coupon_id"],
      couponValue: json["coupon_value"],
      serviceId: json["service_id"],
      total: json["total"],
      watch: json["watch"],
      userId: json["user_id"],
      status: json["status"],
      paymentMethod: json["payment_method"],
      providerId: json["provider_id"],
      scheduleTime: DateTime.parse(json["schedule_time"]),
      notes: json["notes"],
      providerLong: json["provider_long"],
      providerLat: json["provider_lat"],
      userLong: json["user_long"],
      userLat: json["user_lat"],
      acceptProvider: json["accept_provider"],
      therest: json["therest"],
      providerStart: json["provider_start"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      providerName: json["provider_name"],
      userName: json["user_name"],
      userPhone: json["user_phone"],
      userImage: json["user_image"],
      userEmail: json["user_email"],
      serviceNameAr: json["service_name_ar"],
      serviceNameEn: json["service_name_en"],
      ratCount: json["rat_count"],
      ratSum: json["rat_sum"],
      providerPhone: json["provider_phone"],
      providerEmail: json["provider_email"],
      providerImage: json["provider_image"],
    );
  }
}
