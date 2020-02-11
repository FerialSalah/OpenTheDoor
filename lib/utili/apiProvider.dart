import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_openthedoor/models/aboutApp.dart';
import 'package:flutter_openthedoor/models/appContact.dart';
import 'package:flutter_openthedoor/models/providerCardModel.dart';
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
      'password': password,
      'password_confirmation': passwordConfirmation,
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

  Future<String> getMyInviteCode() async {
    ///TODO:Complete this
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String code = "";
    var headers = {
      "Authorization": "Bearer ${prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    Response response = await Dio()
        .get("$baseUrl$getBalance", options: Options(headers: headers));
    code = response.data['userwallet']['user_balance'];
    return code;
  }

  //////////////////////////////
  //     app info requests    //
  //////////////////////////////

  Future <List<ProviderCardModel>>getProviders() async {
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
    data.forEach((value) {
      providers.add(ProviderCardModel.fromApi(value));
    });
    return providers;
  }

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

}
