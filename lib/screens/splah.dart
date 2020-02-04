import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
    } else {
      Navigator.of(context).pushReplacementNamed('/ChooseLanguage');
    }
  }

  @override
  void initState() {
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
          SizedBox.fromSize(size: Size(50.0, 100.0)),
          SpinKitCircle(
            color: Colors.white,
            duration: Duration(seconds: 5),
          ),
        ],
      )),
    );
  }
}
