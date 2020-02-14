import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'application.dart';
import 'localization.dart';
import 'screens/chooselanguage_screen.dart';
import 'screens/splah.dart';

AppLocalizationsDelegate _appLocalizationsDelegate =
    new AppLocalizationsDelegate(newLocale: null);

void main() => runApp(MaterialApp(
    localizationsDelegates: [
      _appLocalizationsDelegate,
      const AppLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: application.supportedLocales(),
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    routes: <String, WidgetBuilder>{
      '/ChooseLanguage': (BuildContext context) => ChooseLanguage(),
    }));
