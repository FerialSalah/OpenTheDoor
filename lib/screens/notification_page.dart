import 'package:flutter/material.dart';

import '../localization.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translateString('notifications')),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translateString('notification_data'),
                style: TextStyle(
                  fontSize: 25.0,
                ),

              )],
          ),
        ));
  }
}
