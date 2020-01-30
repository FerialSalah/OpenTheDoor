import 'package:dio/dio.dart';

class ApiProvider{
 static String baseurl = "http://openthedoor.tawartec.com/api/";
 static String login = "login";
 static String register = "register";
 static String userinfo = "userinfo";
 static String updateprofile = "updateprofile";
 static String changepassword = "changepassword";



 static userLogin() async {
   Dio dio = new Dio();
   Response response;
   response = await dio.post("$baseurl$login");
   
 } 
 

}