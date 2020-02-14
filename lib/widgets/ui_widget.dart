import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/activation_code.dart';
import 'package:flutter_openthedoor/screens/sign_in.dart';

import '../localization.dart';

Widget phoneTextFiled(BuildContext context) {
  return Row(
    children: <Widget>[
      Text(
        '966',
      ),
      SizedBox(
        width: 5,
      ),
      new Flexible(
        child: TextFormField(
          // validator: ,

          keyboardType: TextInputType.phone,
          cursorColor: Color(0xFFC89C17),
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).text('phone'),
              labelStyle: TextStyle(
                color: Color(0xFFC89C17),
              ),
              hasFloatingPlaceholder: true,
              prefixIcon: Icon(Icons.phone_android, color: Color(0xFFC89C17)),
              counterStyle: TextStyle(color: Color(0xFFC89C17))),
        ),
      ),
    ],
  );
}

Positioned positioned = Positioned(
    top: 110,
    left: 100,
    right: 100,
    child: Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50.0,
        child: Icon(
          Icons.lock,
          color: Color(0xFFC89C17),
        ),
      ),
    )
    );
Widget passwordTextFiled(BuildContext context) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: AppLocalizations.of(context).text('password_txt'),
      hasFloatingPlaceholder: true,
      prefixIcon: Icon(
        Icons.lock,
        color: Color(0xFFC89C17),
      ),
    ),
  );
}

Widget continueButton(BuildContext context) {
  return FlatButton(
    child: Text(AppLocalizations.of(context).text('continue')),
    color: Color(0xFFC89C17),
    textColor: Colors.white,
    padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: () {
      
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ActivationCodePage()));
    },
  );
}

Widget cardSignUp(BuildContext context) {
  return 
  
  Card(
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
                          labelText: AppLocalizations.of(context)
                              .text('phone'),
                          labelStyle: TextStyle(
                            color: Color(0xFFC89C17),
                          ),
                          hasFloatingPlaceholder: true,
                          prefixIcon:
                              Icon(Icons.phone_android, color: Color(0xFFC89C17)),
                          counterStyle: TextStyle(color: Color(0xFFC89C17))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              continueButton(context),
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
                        .text("don't_have_account"),
                    style: TextStyle(color: Colors.black),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    textColor: Color(0xFFC89C17),
                    child: Text(AppLocalizations.of(context)
                        .text('btn_login')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
