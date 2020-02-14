import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_openthedoor/screens/drawer.dart';
import 'package:flutter_openthedoor/screens/providerDetails.dart';
import 'package:flutter_openthedoor/screens/signup_continue.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';
import '../localization.dart';
import 'edit_profile.dart';
import 'sign_in.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  AppLocalizationsDelegate _appLocalizationsDelegate;

  @override
  void initState() {
    super.initState();
    _appLocalizationsDelegate = new AppLocalizationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseLanguagePage(),
      localizationsDelegates: [
        _appLocalizationsDelegate,
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    );
  }
}

class ChooseLanguagePage extends StatefulWidget {
  @override
  _ChooseLanguagePageState createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  AppLocalizationsDelegate _appLocalizationsDelegate;

  Locale locale;

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  String language;

  get prefs => null;

  set token(token) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC89C17),
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).text('title_select_language')),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/openthedoor_logo.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                        
                    setState(() {
                      language = "English";
                      pref.setString('lang', language);
                      print(language);
                      application
                          .onLocaleChanged(Locale(languagesMap[language]));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  textColor: Color(0xFFC89C17),
                  color: Colors.white,
                  height: 40,
                  minWidth: 280,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'English',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    setState(() {
                      language = "Arabic";
                      print(language);
                      pref.setString('lang', language);
                      application
                          .onLocaleChanged(Locale(languagesMap[language]));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  color: Colors.white,
                  textColor: Color(0xFFC89C17),
                  height: 40,
                  minWidth: 280,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'العربية',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      AppLocalizations.load(locale);
    });
  }
}
