import 'package:flutter/material.dart';

import '../localization.dart';
import 'change_password.dart';
import 'edit_profile.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translateString('profile')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body:SingleChildScrollView(
          // Optional
          child: Form(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 4),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: cardProfile(context),
                    )
                  ],
                ),
                profileImage(context)
              ],
            ),
          ),

      ),
    );
  }
}
Widget cardProfile(BuildContext context) {

  return Card(
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
            Text('Name',),
            SizedBox(
              height: 20,
            ),
            Text('Phone',),
            SizedBox(
              height: 20,
            ),
            Text('Email',),
            SizedBox(
              height: 20,
            ),
            editProfileButton(context),
            SizedBox(
              height: 20,
            ),
            changePasswordButton(context)

          ],
        ),
      ),
    ),
  );

  }

Widget editProfileButton(BuildContext context) {
  return MaterialButton(
    minWidth: 250.0,
    height: 20.0,
    child: Text(AppLocalizations.of(context).translateString('edit_profile')),
    color: Color(0xFFC89C17),
    textColor: Colors.white,
    padding: EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: () {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));


    },);
}

  Widget changePasswordButton(BuildContext context) {
    return MaterialButton(
      minWidth: 250.0,
      height: 20.0,
      child: Text(AppLocalizations.of(context).translateString('change_password')),
      color: Color(0xFFC89C17),
      textColor: Colors.white,
      padding: EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));

      },);
}

Widget profileImage(BuildContext context) {
  return Positioned(
      top: 110,
      left: 100,
      right: 100,
      child: Container(
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50.0,
          child: Icon(
            Icons.account_circle,
            color: Color(0xFFC89C17),
            size: 80.0,
          ),
        ),
      ));
}
