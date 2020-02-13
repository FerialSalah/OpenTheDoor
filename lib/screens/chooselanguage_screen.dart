import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_openthedoor/screens/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';
import '../localization.dart';
import 'drawer.dart';
import 'sign_in.dart';
import 'history_page.dart';

class ChooseLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseLanguagePage(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
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

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    return  Locale(
        prefs.getString('language_code'), prefs.getString('country_code'));
  }

  @override
  void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        this.locale = locale;
      });
    });
    _appLocalizationsDelegate = AppLocalizationsDelegate();
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC89C17),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translateString('title_select_language')),
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
                  onPressed:()async =>  {
                    setState(() {
              AppLocalizations(Locale(languagesMap['English']));
              AppLocalizations appLocalization =
              new AppLocalizations(Locale(languagesMap['English']));
               appLocalization.load();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Test()));
                    })
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
                  onPressed: () => {
                    setState(() {
                      AppLocalizations(Locale(languagesMap['Arabic']));
                      AppLocalizations appLocalization =
                          new AppLocalizations(Locale(languagesMap['Arabic']));
                      appLocalization.load();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    })
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
      _appLocalizationsDelegate = AppLocalizationsDelegate();
    });
  }
}

_getLanguageCode(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}
