import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../application.dart';
import '../localization.dart';
import 'drawer.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppLocalizationsDelegate _appLocalizationsDelegate;

  Locale locale;

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: locale);
    });
  }

  Future<void> navigationPage() async {
    _appLocalizationsDelegate = new AppLocalizationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token != null) {
      application
          .onLocaleChanged(Locale(languagesMap[prefs.getString('lang')]));
      AppLocalizations.load(Locale(languagesMap[prefs.getString('lang')]));
      _appLocalizationsDelegate = new AppLocalizationsDelegate(
          newLocale: Locale(languagesMap[prefs.getString('lang')]));

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
