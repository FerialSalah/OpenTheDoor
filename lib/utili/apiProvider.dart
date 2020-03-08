import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_openthedoor/models/aboutApp.dart';
import 'package:flutter_openthedoor/models/appContact.dart';
import 'package:flutter_openthedoor/models/notifications.dart';
import 'package:flutter_openthedoor/models/provider.dart';
import 'package:flutter_openthedoor/models/providerCardModel.dart';
import 'package:flutter_openthedoor/models/serviceDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  static String baseUrl = "http://openthedoor.tawartec.com/api/";
  static String login = "login";
  static String register = "register";
  static String userinfo = "userinfo";
  static String updateprofile = "updateprofile";
  static String changepassword = "changepassword";
  static String appInfo = "appinfo";
  static String aboutUs = "aboutus";
  static String code = "sendcode";
  static String checkcode = "checkcode";
  static String getBalance = "getuserversbalance";
  static String getProvider =
      "getserviceprovider?page=1&limit=10&sort=lp&user_lat=12.2121&user_long=12.3333&service_id=9";
  static String providerDetails = "getProvider";
  static String makeOrderLink = "adduserservice";
  static String historyLink = "getuserservicehistory";
  static String notficationsLink = "getgeneralnotfication";
  static String serviceHandling = "aedituserservice";

  //////////////////////////////
  //   User related requests  //
  //////////////////////////////

  Future<int> registration(
      {String userName,
      String email,
      String password,
      String passwordConfirmation,
      String phone,
      File img}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    FormData data = new FormData.fromMap({
      'name': userName,
      'email': email,
      'phone': phone,
      "image": img != null ? await MultipartFile.fromFile(img.path) : null
    });
    print(prefs.getString('token'));
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Response response = await Dio().post("$baseUrl$updateprofile",
        data: data, options: Options(headers: headers));
    print("========");
    print("======> $response");
    prefs.setInt('id', response.data['user']['id']);
    prefs.setString("phone", response.data['user']['phone']);
    prefs.setString('token', response.data['user']['api_token']);
    prefs.setString('email', response.data['user']['email']);
    prefs.setString('name', response.data['user']['name']);
    prefs.setString('userAvatar', response.data['user']['user_image']);
    prefs.setString(
        'invitation_code', response.data['user']['invitation_code']);

    print("========");
    print("======> $response");

    var headers2 = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    var data2 = {
      "password": password,
      "password_confirmation": passwordConfirmation,
      "user_id": response.data['user']['id'],
    };

    Response response2 = await Dio().post("${baseUrl}setpassword",
        data: data2, options: Options(headers: headers2));
    print("========");
    print("======> $response2");
    return 200;
  }

  ////////////////////////////

  Future<int> changePassword(
      {String currentPassword,
      String newPassword,
      String confirmPassword}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      "user_id": prefs.getInt('id'),
      "current_password": "$currentPassword",
      "password": "$newPassword",
      "password_confirmation": "$confirmPassword"
    };

    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Response response = await Dio().post("${baseUrl}setpassword",
        data: data, options: Options(headers: headers));
    print("========");
    print("======> $response");

    return 200;
  }

  ////////////////////////////

  Future<int> userLogin({String phone, String password}) async {
    print("======= $phone   $password");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Login can be done by using email or user
    var data = {'phone': phone, 'password': password};
    Response response = await Dio().post("$baseUrl$login", data: data);
    print("======> $response");

    prefs.setInt('id', response.data['user']['id']);
    prefs.setString('token', response.data['user']['api_token']);
    prefs.setString('email', response.data['user']['email']);
    prefs.setString('name', response.data['user']['name']);
    prefs.setString('userAvatar', response.data['user']['user_image']);
    prefs.setString(
        'invitation_code', response.data['user']['invitation_code']);

    print("========");
    print("======> $response");
    return 200;
  }

  ////////////////////////////
  Future<int> userEdit(
      {String userName, String email, String phone, File img}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var headerData = {'Authorization': 'Bearer $token'};

    var jsonData = {
      'name': userName == "" ? null : userName,
      'email': email == "" ? null : email,
      'phone': phone == "" ? null : phone,
      "image": await MultipartFile.fromFile(img.path)
    };

    FormData data = new FormData.fromMap(jsonData);
    print(data.fields);

    Response response = await Dio().post("$baseUrl$updateprofile",
        data: data, options: Options(headers: headerData));
    prefs.setInt('id', response.data['user']['id']);
    prefs.setString('email', response.data['user']['email']);
    prefs.setString('name', response.data['user']['name']);
    prefs.setString('userAvatar', response.data['user']['user_image']);
    print("========");
    print("======> $response");
    return 200;
  }

  ////////////////////////////

  Future<int> editPassword(
      String current, String newPassword, String confirmation) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var headerData = {'Authorization': 'Bearer $token'};

    var jsonData = {
      "current_password": current,
      "password": newPassword,
      "password_confirmation": confirmation
    };

    FormData data = new FormData.fromMap(jsonData);
    print(data.fields);

    Response response = await Dio().post("$baseUrl$changepassword",
        data: data, options: Options(headers: headerData));
    print(response.data);

    return 200;
  }

  ////////////////////////////

  Future<int> getCode({String phone}) async {
    var jsonData = {"phone": "$phone"};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await Dio().post("$baseUrl$code", data: jsonData);
    prefs.setInt('code', response.data['user']['activecode']);
    prefs.setString('phone', response.data['user']['phone']);
    print(response.data);
    return 200;
  }
  ////////////////////////////

  verifyCode({String phone, String code}) async {
    var jsonData = {"phone": "$phone", "code": "$code"};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await Dio().post("$baseUrl$checkcode", data: jsonData);
    prefs.setString("token", response.data['userinfo']['api_token']);
  }

  ////////////////////////////

  Future<AboutUsModel> getUserInfo() async {
    AboutUsModel about;
    Response response = await Dio().get("$baseUrl$code");
    var data = response.data['aboutus'];
    print(response.data);
    about = AboutUsModel.fromApi(data);
    return about;
  }

  ////////////////////////////

  Future<int> getWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int balance = 0;
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio()
        .get("$baseUrl$getBalance", options: Options(headers: headers));
    balance = response.data['userwallet']['user_balance'];
    return balance;
  }

  ////////////////////////////

  Future<List<Generalnotfication>> getNotification() async {
    List<Generalnotfication> notfications = new List();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio()
        .get("$baseUrl$notficationsLink", options: Options(headers: headers));
    var data = response.data['Generalnotfication'];
    data.forEach((value) {
      notfications.add(Generalnotfication.fromApi(value));
    });
    return notfications;
  }

  //////////////////////////////

  Future<int> makeOrder(int id) async {
    var data = {
      "service_id": 5,
      "provider_id": id,
      "status": "current",
      "request": 0,
      "provider_hour_to_finish": 1,
      "provider_minutes_to_arrive": 1,
      "payment_method": "cash",
      "notes": "Notes",
      "schedule_time": 121,
      "user_long": 12.2121,
      "user_lat": 13.222
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio().post("$baseUrl$makeOrderLink",
        data: data, options: Options(headers: headers));
    print(response.data);
  }

  //////////////////////////////

  Future<List<List<ServiceDetailsModel>>> getHistory() async {
    List<List<ServiceDetailsModel>> history = new List();
    List<ServiceDetailsModel> current = new List();
    List<ServiceDetailsModel> canceled = new List();
    List<ServiceDetailsModel> inProccing = new List();
    List<ServiceDetailsModel> completed = new List();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio()
        .get("$baseUrl$historyLink", options: Options(headers: headers));

    var data = response.data['userserviceinfo'];
    print(data);
    data['current'].forEach((value) {
      current.add(ServiceDetailsModel.fromApi(value));
    });
    data['inprocess'].forEach((value) {
      inProccing.add(ServiceDetailsModel.fromApi(value));
    });
    data['completed'].forEach((value) {
      completed.add(ServiceDetailsModel.fromApi(value));
    });
    data['canceled'].forEach((value) {
      canceled.add(ServiceDetailsModel.fromApi(value));
    });

    history.add(completed);
    history.add(inProccing);
    history.add(current);
    history.add(canceled);
    print(history.length);
    return history;
  }

  //////////////////////////////
  //     app info requests    //
  //////////////////////////////

  Future<Provider> getProviderDetails(int id) async {
    Provider provider;
    var data;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio().get(
        "$baseUrl$providerDetails?provider_id=$id",
        options: Options(headers: headers));
    data = response.data['providerinfo'];
    provider = Provider.fromApi(data);
    print(provider.name);
    return provider;
  }

  /////////////////////////////

  Future<List<ProviderCardModel>> getProviders() async {
    List<ProviderCardModel> providers = new List();
    var data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio()
        .get("$baseUrl$getProvider", options: Options(headers: headers));
    data = response.data['providerservice'];
    print(data);
    data.forEach((value) {
      providers.add(ProviderCardModel.fromApi(value));
    });
    return providers;
  }

  /////////////////////////////

  Future<AppContactModel> getAppContact() async {
    AppContactModel contact;
    Response response = await Dio().get("$baseUrl$appInfo");
    var data = response.data['appinfo'];
    contact = AppContactModel.fromApi(data);
    return contact;
  }

  ////////////////////////////

  Future<AboutUsModel> getAppAbout() async {
    AboutUsModel about;
    Response response = await Dio().get("$baseUrl$aboutUs");
    var data = response.data['aboutus'];
    print(response.data);
    about = AboutUsModel.fromApi(data);
    return about;
  }

  ////////////////////////////

  Future<int> editorder(
      {int providerId,
      int userId,
      String status,
      String note,
      int bonus}) async {
    var data = {
      "provider_id": providerId,
      "user_service_id": userId,
      "status": status,
      "provider_start":1,
      "note": "${note == null ? "test" : note}",
      "service_id": "5",
      "bounce": bonus == null ? 0 : bonus
    };
   
    SharedPreferences prefs = await SharedPreferences.getInstance();


    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Response response = await Dio().post("$baseUrl$serviceHandling",
        data: data, options: Options(headers: headers));
    print(response.data);
  }
}
