import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization.dart';
import 'drawer.dart';

class SignUpFinalPage extends StatefulWidget {
  @override
  _SignUpFinalPageState createState() => _SignUpFinalPageState();
}

class _SignUpFinalPageState extends State<SignUpFinalPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool isLoading = false;
  bool autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        setState(() {
          isLoading = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        ApiProvider api = new ApiProvider();
        await api.registration(
            img: img,
            password:_passwordController.text,
            passwordConfirmation: _passwordController.text,
            userName: _nameController.text,
            phone: prefs.getString('phone'),
            email: _emailController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } catch (e) {
        print(e.response);
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

  static File img;
  Widget profileImage(BuildContext context) {
    return Positioned(
        top: 110,
        left: 100,
        right: 100,
        child: Container(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              img = Helpers.selectImg(context);
              setState(() {
                img.path;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child:ClipOval(
                child:  img == null
                    ? Icon(
                  Icons.account_circle,
                  color: Color(0xFFC89C17),
                  size: 80.0,
                )
                    : Image.file(img,width: 100.0,height: 100.0,fit: BoxFit.cover,),
              ),
              radius: 50.0,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).text('btn_register')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: Form(
        key: _formKey,
        autovalidate: autovalidate,
        child: SingleChildScrollView(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _nameController,
                              validator: (String arg) {
                                if (arg.length < 1)
                                  return 'enter vaild name';
                                else
                                  return null;
                              },
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xFFC89C17),
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .text('name'),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (String arg) {
                                print(Helpers.emailvalidator(arg));
                                if (Helpers.emailvalidator(arg) == false)
                                  return 'enter vaild email';
                                else
                                  return null;
                              },
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xFFC89C17),
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .text('email'),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.email,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            TextFormField(
                              validator: (String arg) {
                                if (arg.length < 6)
                                  return 'enter password with 6 characters';
                                else
                                  return null;
                              },
                              controller: _passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xFFC89C17),
                              onSaved: (String arg) {
                                print(arg);
                                _passwordController.text = arg;
                              },
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .text("password"),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.lock,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              onChanged: (String arg) {
                                print(arg);
                                print(_passwordController.text);
                              },
                              validator: (String arg) {
                                if (_passwordController.text == arg)
                                  return null;
                                else
                                  return 'passwords not matched';
                              },
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xFFC89C17),
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .text("confirm _password"),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.lock,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FlatButton(
                              child: Text(AppLocalizations.of(context)
                                  .text('btn_register')),
                              color: Color(0xFFC89C17),
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                validateInputs();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
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
