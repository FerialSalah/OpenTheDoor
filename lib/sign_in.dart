import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/sign_up.dart';
import 'localization.dart';
import 'ui_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC89C17),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              loginCard(context),
              positioned

            ],
          ),),
        );
  }
}

Widget loginCard(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                phoneTextFiled(context),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 20,
                ),
               passwordTextFiled(context),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: Text(AppLocalizations.of(context).translateString('btn_login')),
                  color: Color(0xFFC89C17),
                  textColor: Colors.white,
                  padding:
                      EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).translateString('forget_password')),
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
                    Text(AppLocalizations.of(context).translateString("don't_have_account")
                       ,
                      style: TextStyle(color: Colors.black),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen ()));

                      },
                      textColor: Color(0xFFC89C17),
                      child: Text( AppLocalizations.of(context).translateString('btn_register')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}




