import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/utili/helpers.dart';
import 'package:flutter_openthedoor/widgets/ui_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization.dart';


class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

String phone = ""; 
  Future<void> _validateInputs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print("sss");
      ApiProvider api = new ApiProvider();
      api.getCode(phone: phone);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ()));
    } catch (e) {
      setState(() {
        Helpers.showTheDialog(context, "error", "incorrect code");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title: Text('Forget Password'),
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
Widget cardSignUp(BuildContext context) {
  return Card(
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
onChanged: (String arg){},
                      keyboardType: TextInputType.phone,
                      cursorColor: Color(0xFFC89C17),
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translateString('phone'),
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


                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
