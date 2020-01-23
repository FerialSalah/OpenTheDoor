import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/profile.dart';

import 'localization.dart';
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translateString('edit_profile')),
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
                      child:editProfileCard(context)
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


Widget editProfileCard(BuildContext context){
  return  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType. text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("name"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.account_circle, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(

            keyboardType: TextInputType.emailAddress,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("email"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.email, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(

            keyboardType: TextInputType. phone,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("phone"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.phone_android, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),

          MaterialButton(
            minWidth: 250.0,
            height: 10.0,
            child: Text(AppLocalizations.of(context).translateString("save")),
            color: Color(0xFFC89C17),
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {


            },
          ),


        ],
      ),
    ),
  );




}