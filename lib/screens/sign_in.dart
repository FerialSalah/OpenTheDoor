import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/sign_up.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';
import '../localization.dart';
import 'drawer.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  bool isLoading = false;
  bool autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        print("sssssss");
        setState(() {
          isLoading = true;
        });
        ApiProvider api = new ApiProvider();
        print( _passController.text);
        print(_phoneController.text);
        await api.userLogin(
            phone: _phoneController.text, password: _passController.text);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
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
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.7,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                    key: _formKey,
                    autovalidate: autovalidate,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            autovalidate: autovalidate,
                            validator: (String arg) {
                              if (arg.length < 6)
                                return 'enter vaild mobile number';
                              else
                                return null;
                            },
                            onSaved: (String arg) {
                              _phoneController.text = arg;
                            },
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xFFC89C17),
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)
                                    .text('phone'),
                                labelStyle: TextStyle(
                                  color: Color(0xFFC89C17),
                                ),
                                hasFloatingPlaceholder: true,
                                prefixText: "+966 ",
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
                              print(arg);
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
                                  .text('password_txt'),
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
                          Container(
                            child: isLoading == true
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.yellow)
                                : FlatButton(
                                    child: Text(AppLocalizations.of(context)
                                        .text('btn_login')),
                                    color: Color(0xFFC89C17),
                                    textColor: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 38,
                                        right: 38,
                                        top: 15,
                                        bottom: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: () {
                                      _validateInputs();
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => sign()));
                            },
                            child: Text(AppLocalizations.of(context)
                                .text('forget_password')),
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
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                textColor: Color(0xFFC89C17),
                                child: Text(AppLocalizations.of(context)
                                    .text('btn_register')),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
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
              ),
            )
          ])
        ],
      ),
    );
  }
}
