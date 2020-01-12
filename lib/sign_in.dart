import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC89C17),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              loginCard(context),
              Positioned(
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
                    
                  )),

            ],
          ),
        ));
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
                SizedBox(
                  height: 15,
                ),
                TextFormField(

                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    hasFloatingPlaceholder: true,
                    prefixIcon:
                        Icon(Icons.phone_android, color: Color(0xFFC89C17)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
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
                  child: Text("SIGN IN"),
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
                  child: Text("Forgot Password ?"),
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
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                    FlatButton(
                      onPressed: () {},
                      textColor: Color(0xFFC89C17),
                      child: Text("Sign Up"),
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
