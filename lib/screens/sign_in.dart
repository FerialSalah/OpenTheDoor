import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/sign_up.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';
import 'package:flutter_openthedoor/widgets/ui_widget.dart';

import '../localization.dart';
import 'drawer.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  bool autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        ApiProvider api = new ApiProvider();
        api.userLogin(
            phone: _phoneController.text, password: _passController.text);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
      } catch (e) {
        Helpers.showTheDialog(context, "error", "error");
      }
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      body: SingleChildScrollView(
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
                        key: _formKey,
                        autovalidate: autovalidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autovalidate: autovalidate,
                              validator: (String arg) {
                                if (arg.length < 9)
                                  return 'Name must be more than 9 charater';
                                else
                                  return null;
                              },
                              onSaved: (String arg) {
                                _phoneController.text = arg;
                              },
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              cursorColor: Color(0xFFC89C17),
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .translateString('phone'),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.phone_android,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (String arg) {
                                if (arg.length < 6)
                                  return 'password must be more than 6 charater';
                                else
                                  return null;
                              },
                              onSaved: (String arg) {
                                _passController.text = arg;
                              },
                              autovalidate: autovalidate,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)
                                    .translateString('password_txt'),
                                hasFloatingPlaceholder: true,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xFFC89C17),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              child: Text(AppLocalizations.of(context)
                                  .translateString('btn_login')),
                              color: Color(0xFFC89C17),
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                _validateInputs();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Text(AppLocalizations.of(context)
                                  .translateString('forget_password')),
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
                                      .translateString("don't_have_account"),
                                  style: TextStyle(color: Colors.black),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  textColor: Color(0xFFC89C17),
                                  child: Text(AppLocalizations.of(context)
                                      .translateString('btn_register')),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            positioned
          ],
        ),
      ),
    );
  }
}
