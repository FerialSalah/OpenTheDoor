import 'package:flutter/material.dart';

import '../localization.dart';
class InviteFriendScreen extends StatefulWidget {
  @override
  _InviteFriendScreenState createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
        Text(AppLocalizations.of(context).translateString('invite_friend')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
    );
  }
}
