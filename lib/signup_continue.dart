import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/test.dart';
import 'package:flutter_openthedoor/ui_widget.dart';

import 'drawer.dart';
import 'localization.dart';

class SignUpFinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('btn_register')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: Form(
        child: SingleChildScrollView(
          // Optional
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: passwordFiled(context),
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

Widget passwordFiled(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString('name'),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon:
                    Icon(Icons.account_circle, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translateString('email'),
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
          FlatButton(
            child: Text(AppLocalizations.of(context).translateString('btn_register')),
            color: Color(0xFFC89C17),
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TestPage()));            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
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
          child: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {

            },
            color: Color(0xFFC89C17),
            iconSize: 80.0,
            alignment: Alignment.center,
          ),

//          child: Icon(
//            Icons.account_circle,
//            color: Color(0xFFC89C17),
//
//          ),
        ),
      ));
}
