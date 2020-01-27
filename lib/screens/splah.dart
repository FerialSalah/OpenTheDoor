import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chooselanguage_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/ChooseLanguage');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFC89C17)));
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/openthedoor_logo.png'),
              SizedBox.fromSize(size:Size(50.0, 100.0)),
              SpinKitCircle(color: Colors.white,duration: Duration(seconds: 5),),
            ],
          )),
    );
  }
}