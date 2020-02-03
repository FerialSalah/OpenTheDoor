import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/sign_in.dart';
import 'package:flutter_openthedoor/widgets/ui_widget.dart';

import '../localization.dart';
import 'activation_code.dart';

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
        title:
            Text(AppLocalizations.of(context).translateString('btn_register')),
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '966',
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        // validator: ,

                                        keyboardType: TextInputType.phone,
                                        cursorColor: Color(0xFFC89C17),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .translateString('phone'),
                                            labelStyle: TextStyle(
                                              color: Color(0xFFC89C17),
                                            ),
                                            hasFloatingPlaceholder: true,
                                            prefixIcon: Icon(
                                                Icons.phone_android,
                                                color: Color(0xFFC89C17)),
                                            counterStyle: TextStyle(
                                                color: Color(0xFFC89C17))),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FlatButton(
                                  child: Text(AppLocalizations.of(context)
                                      .translateString('continue')),
                                  color: Color(0xFFC89C17),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 38, right: 38, top: 15, bottom: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActivationCodePage()));
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translateString(
                                              "don't_have_account"),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInScreen()));
                                      },
                                      textColor: Color(0xFFC89C17),
                                      child: Text(AppLocalizations.of(context)
                                          .translateString('btn_login')),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
