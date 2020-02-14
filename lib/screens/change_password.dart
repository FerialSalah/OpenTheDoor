import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';

import '../localization.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _oldPassController = new TextEditingController();
  TextEditingController _newPassController = new TextEditingController();
  TextEditingController _confrimPasswordController =
      new TextEditingController();

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
        ApiProvider api = new ApiProvider();
        await api.changePassword(
          currentPassword: _oldPassController.text,
          newPassword: _newPassController.text,
          confirmPassword: _confrimPasswordController.text,
        );
         Helpers.showTheDialog(context, "done", "done");
          isLoading = false;
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

  String linkImg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).text('change_password')),
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
                                TextFormField(
                                  validator: (String arg) {
                                    print(arg);
                                    if (arg.length < 6)
                                      return 'password must be more than 6 charater';
                                    else
                                      return null;
                                  },
                                  controller: _oldPassController,
                                  onSaved: (String arg) {
                                    _oldPassController.text = arg;
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xFFC89C17),
                                  decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)
                                          .text("old_password"),
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
                                  validator: (String arg) {
                                    print(arg);
                                    if (arg.length < 6)
                                      return 'password must be more than 6 charater';
                                    else
                                      return null;
                                  },
                                  controller: _newPassController,
                                  onSaved: (String arg) {
                                    _newPassController.text = arg;
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xFFC89C17),
                                  decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)
                                          .text("new _password"),
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
                                  validator: (String arg) {
                                    print(arg);
                                    if (arg.length < 6)
                                      return 'password must be more than 6 charater';
                                    else
                                      return null;
                                  },
                                  controller: _confrimPasswordController,
                                  onSaved: (String arg) {
                                    _confrimPasswordController.text = arg;
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
                                Container(
                                  child: isLoading == true
                                      ? CircularProgressIndicator(
                                          backgroundColor: Colors.yellow)
                                      : MaterialButton(
                                          minWidth: 250.0,
                                          height: 20.0,
                                          child: Text(
                                              AppLocalizations.of(context)
                                                  .text("save")),
                                          color: Color(0xFFC89C17),
                                          textColor: Colors.white,
                                          padding: EdgeInsets.only(
                                              left: 38,
                                              right: 38,
                                              top: 15,
                                              bottom: 15),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          onPressed: () {
                                            validateInputs();
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Positioned(
                  top: 110,
                  left: 100,
                  right: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: linkImg == null || linkImg == ""
                          ? Icon(
                              Icons.account_circle,
                              color: Color(0xFFC89C17),
                              size: 80.0,
                            )
                          : NetworkImage(linkImg),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
