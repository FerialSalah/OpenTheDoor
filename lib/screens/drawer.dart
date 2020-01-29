import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/payment_page.dart';
import 'package:flutter_openthedoor/screens/profile.dart';

import '../localization.dart';
import 'contact_us_page.dart';
import 'history_page.dart';

import 'notification_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('title_home')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: Center(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFC89C17),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 200,
                        child: Center(
                          child: Text('Background image goes here'),
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        bottom:
                            60.0, // (background container size) - (circle height / 2)
                        child: Container(
                          height: 300.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
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
                // Update the state of the app
                // ...
                // Then close the drawer
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()));
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
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
                // Update the state of the app
                // ...
                // Then close the drawer
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (contxt)=>ContactUsScreen()));
              },
            ),
            ListTile(
              title: Text('About Company'),
              leading: Icon(
                Icons.question_answer,
                color: Color(0xFFC89C17),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
