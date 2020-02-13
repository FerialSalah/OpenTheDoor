import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/payment_page.dart';
import 'package:flutter_openthedoor/screens/profile.dart';
import 'package:flutter_openthedoor/screens/promo_code_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization.dart';
import 'about_us_page.dart';
import '../map.dart';
import 'contact_us_page.dart';
import 'history_page.dart';

import 'invite_friend_page.dart';
import 'language_page.dart';
import 'notification_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  String linkImg = "";

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    linkImg = prefs.getString('userAvatar');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('title_home')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: MapViewScreen(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                  child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      name == null || name =="" ?'user':name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: linkImg == null || linkImg == "" ? Icon(
                        Icons.account_circle,
                        size: 80.0,
                        color: Color(0xFFC89C17),
                      ): NetworkImage(linkImg) ,
                    )
                  ],
                ),
              )),
              color: Color(0xFFC89C17),
            ),
            ListTile(
              title: Text('profile'),
              leading: Icon(
                Icons.account_circle,
                color: Color(0xFFC89C17),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              title: Text('History'),
              leading: Icon(
                Icons.history,
                color: Color(0xFFC89C17),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
            ),
            ListTile(
              title: Text('Balance'),
              leading: Icon(
                Icons.account_balance_wallet,
                color: Color(0xFFC89C17),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
              },
            ),
            ListTile(
              title: Text('Promo Code'),
              leading: Icon(
                Icons.code,
                color: Color(0xFFC89C17),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PromoCodeScreen()));
              },
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(
                Icons.notifications,
                color: Color(0xFFC89C17),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxt) => NotificationScreen()));
              },
            ),
            ListTile(
              title: Text('Language'),
              leading: Icon(
                Icons.language,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LanguageScreen()));
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              leading: Icon(
                Icons.phone,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (contxt) => ContactUsScreen()));
              },
            ),
            ListTile(
              title: Text('About Company'),
              leading: Icon(
                Icons.help,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (contxt) => AboutUsScreen()));
              },
            ),
            ListTile(
              title: Text('Invite Friend'),
              leading: Icon(
                Icons.share,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxt) => InviteFriendScreen()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
