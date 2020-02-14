import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/splah.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';
import '../localization.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).text('language')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () async {
              //Navigator.pop(context);
              await createAlertDialog(context);
              print('ok');
              SharedPreferences pref = await SharedPreferences.getInstance();
              print(pref.getString('lang'));

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SplashPage()));
             
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26)),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context).text('language'),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(AppLocalizations.of(context).text('english'),
                      style: TextStyle(fontSize: 18.0)),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

createAlertDialog(BuildContext context) {
  Locale locale;

  final List<String> languagesList = application.supportedLanguages;
  final List<String> languageCodesList = application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Language"),
          content: Container(
            width: 200.0,
            height: 100.0,
            child: new Column(
              children: <Widget>[
                new FlatButton(
                  child: Text('English'),
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('lang', 'English');
                    application
                        .onLocaleChanged(Locale(languagesMap['English']));
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('lang', 'Arabic');
                      application
                          .onLocaleChanged(Locale(languagesMap['Arabic']));
                      Navigator.pop(context);
                    },
                    child: Text('Arabic')),
              ],
            ),
          ),
        );
      });
}
