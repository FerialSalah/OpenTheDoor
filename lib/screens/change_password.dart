import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/profile.dart';

import '../localization.dart';


class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translateString('change_password')),
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
                    child:changePasswordCard(context)
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

Widget changePasswordCard(BuildContext context){
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
            obscureText: true,
            keyboardType: TextInputType. text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("old_password"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.lock, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType. text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("new _password"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.lock, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType. text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString("confirm _password"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.lock, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),

          ),
          SizedBox(
            height: 15,
          ),

          MaterialButton(
            minWidth: 250.0,
            height: 20.0,
            child: Text(AppLocalizations.of(context).translateString("save")),
            color: Color(0xFFC89C17),
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {


            },
          ),


        ],
      ),
    ),
  );



}
