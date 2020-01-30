import 'package:flutter/material.dart';

import '../localization.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('about_company')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
    );
  }
}
