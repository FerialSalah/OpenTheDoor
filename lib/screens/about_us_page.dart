import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/aboutApp.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';

import '../localization.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  AboutUsModel about;

  bool isLoading = true;

  void initState() {
    super.initState();
    getAbout();
  }

  getAbout() async {
    ApiProvider api = new ApiProvider();
    about = await api.getAppAbout();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translateString('about_company')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
              child: isLoading == true
                  ? CircularProgressIndicator(backgroundColor: Colors.yellow)
                  : Container(child: Text(about == null ? "" : about.contentAr, style: TextStyle(fontSize:20),))),
        ),
      ]),
    );
  }
}
