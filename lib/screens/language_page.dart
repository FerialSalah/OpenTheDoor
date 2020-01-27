import 'package:flutter/material.dart';

import '../localization.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('language')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
    );
  }
}
