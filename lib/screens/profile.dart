import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization.dart';
import 'change_password.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String linkImg = "";
  String phone = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    linkImg = prefs.getString('userAvatar');
    email = prefs.getString('email');
    phone = prefs.getString('phone');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('profile')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                name == null || name == "" ? "User" : name,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                phone == null || phone == "" ? "phone" : phone,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                email == null || email == "" ? "email" : email,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                minWidth: 250.0,
                                height: 20.0,
                                child: Text(AppLocalizations.of(context)
                                    .translateString('edit_profile')),
                                color: Color(0xFFC89C17),
                                textColor: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 38, right: 38, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileScreen()));
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                minWidth: 250.0,
                                height: 20.0,
                                child: Text(AppLocalizations.of(context)
                                    .translateString('change_password')),
                                color: Color(0xFFC89C17),
                                textColor: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 38, right: 38, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePasswordScreen()));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 110,
                  left: 100,
                  right: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: linkImg == null || linkImg == ""
                          ? Icon(
                              Icons.account_circle,
                              color: Color(0xFFC89C17),
                              size: 80.0,
                            )
                          : NetworkImage(linkImg),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
