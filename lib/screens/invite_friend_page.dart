import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization.dart';

class InviteFriendScreen extends StatefulWidget {
  @override
  _InviteFriendScreenState createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {
  String myCode="";
  @override
  void initState() {
    super.initState();
    getMyCode();
  }

  getMyCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myCode = "${prefs.getString("invitation_code")}";
    print(myCode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).text('invite_friend')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.card_giftcard,
              size: 200.0,
              color: Color(0xFFC89C17),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppLocalizations.of(context).text('invite_friend_text'),
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppLocalizations.of(context).text('your_promocode'),
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              myCode==null ? "":myCode,
              style: TextStyle(
                color: Color(0xFFC89C17),
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: 250.0,
              height: 10.0,
              child: Text(AppLocalizations.of(context).text('invite_friend')),
              color: Color(0xFFC89C17),
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
