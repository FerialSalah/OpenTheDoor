class Provider {
  int id;
  String long;
  String lat;
  int providerId;
  String name;
  String email;
  String image;
  String fileRequier;
  int add;
  int show;
  String phone;
  String active;
  String gender;
  String citizen;
  String employee;
  String residentnumberorstatuscard;
  dynamic placeofemployment;
  DateTime birthdate;
  String activecode;
  dynamic userType;

  Provider({
    this.long,
    this.lat,
    this.providerId,
    this.name,
    this.email,
    this.image,
    this.fileRequier,
    this.add,
    this.show,
    this.phone,
    this.active,
    this.gender,
    this.citizen,
    this.employee,
    this.residentnumberorstatuscard,
    this.placeofemployment,
    this.birthdate,
    this.activecode,
    this.userType,
  });

  factory Provider.fromApi(Map<String, dynamic> json) => Provider(
        long: json["long"],
        lat: json["lat"],
        providerId: json["provider_id"],
        name: json["provider"]["name"],
        email: json["provider"]["email"],
        image: json["provider"]["image"],
        fileRequier: json["provider"]["file_requier"],
        add: json["provider"]["add"],
        show: json["provider"]["show"],
        phone: json["provider"]["phone"],
        active: json["provider"]["active"],
        gender: json["provider"]["gender"],
        citizen: json["provider"]["citizen"],
        employee: json["provider"]["employee"],
        residentnumberorstatuscard: json["provider"]
            ["residentnumberorstatuscard"],
        placeofemployment: json["provider"]["placeofemployment"],
        birthdate: DateTime.parse(json["provider"]["birthdate"]),
        activecode: json["provider"]["activecode"],
        userType: json["provider"]["user_type"],
      );
}
