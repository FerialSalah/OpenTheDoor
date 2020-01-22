import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/sign_in.dart';

import 'localization.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translateString('profile')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: Form(
        child: SingleChildScrollView(
          // Optional
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: profileCard(context),
                  )
                ],
              ),
              profileImage(context)
            ],
          ),
        ),
      ),
    );
  }
}


Widget profileCard(BuildContext context) {

     return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text('Phone'),
              SizedBox(
                height: 15,
              ),
              Text('Email'),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                child: Text(AppLocalizations.of(context)
                    .translateString('edit_profile')),
                color: Color(0xFFC89C17),
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                child: Text(AppLocalizations.of(context)
                    .translateString('change_password')),
                color: Color(0xFFC89C17),
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}

Widget profileImage(BuildContext context) {
  return Positioned(
      top: 110,
      left: 100,
      right: 100,
      child: Container(
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50.0,
          child: Icon(
            Icons.account_circle,
            color: Color(0xFFC89C17),
          ),
        ),
      ));
}
