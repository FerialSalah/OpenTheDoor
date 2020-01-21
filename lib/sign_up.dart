import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/sign_in.dart';
import 'package:flutter_openthedoor/ui_widget.dart';

import 'localization.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    child: cardSignUp(context),
                  )
                ],
              ),
              positioned
            ],
          ),
        ),
      ),
    );
  }
}
