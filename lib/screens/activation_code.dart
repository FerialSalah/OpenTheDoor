import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/signup_continue.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';
import 'package:flutter_openthedoor/widgets/ui_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization.dart';

class ActivationCodePage extends StatefulWidget {
  @override
  _ActivationCodePageState createState() => _ActivationCodePageState();
}

class _ActivationCodePageState extends State<ActivationCodePage> {
  bool isLoading = false;
  bool autovalidate = false;
  int code = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _validateInputs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      _formKey.currentState.save();
      print("sss");
      ApiProvider api = new ApiProvider();
      api.verifyCode(phone: prefs.getString("phone"), code: "$code");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpFinalPage()));
    } catch (e) {
      setState(() {
        autovalidate = true;
        Helpers.showTheDialog(context, "error", "incorrect code");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text("Activation Code"),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: SingleChildScrollView(
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
                        key: _formKey,
                        autovalidate: autovalidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              onChanged: (String arg) {
                                code = int.parse(arg);
                              },
                              validator: (String arg) {
                                if (arg.length < 1)
                                  return 'enter vaild code';
                                else
                                  return null;
                              },
                              keyboardType: TextInputType.number,
                              cursorColor: Color(0xFFC89C17),
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)
                                      .text('code'),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFC89C17),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.verified_user,
                                      color: Color(0xFFC89C17)),
                                  counterStyle:
                                      TextStyle(color: Color(0xFFC89C17))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: isLoading == true
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.yellow)
                                  : FlatButton(
                                      child: Text(AppLocalizations.of(context)
                                          .text('continue')),
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
                                        _validateInputs();
                                      },
                                    ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
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
    );
  }
}
