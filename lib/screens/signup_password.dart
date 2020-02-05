import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/sign_up.dart';
import 'package:flutter_openthedoor/screens/signup_continue.dart';
import 'package:flutter_openthedoor/widgets/ui_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization.dart';
import 'drawer.dart';

class PasswordPage extends StatelessWidget {
  static String password = "";
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
              positioned
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
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFFC89C17),
            onChanged: (String arg) {
              PasswordPage.password = arg;
            },
            decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context).translateString("password"),
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
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context)
                    .translateString("confirm _password"),
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
          FlatButton(
            child:
                Text(AppLocalizations.of(context).translateString("continue")),
            color: Color(0xFFC89C17),
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('password', PasswordPage.password);
              Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SignUpFinalPage()));
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}
