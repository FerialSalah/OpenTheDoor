import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFC89C17),
              ),
             child: Text('profile'),


           ),
            Positioned.fill(

              top: 150.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
//                    image: new DecorationImage(
//                      image: new AssetImage("assets/images/Notification.jpg"),
//                    ) ,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5.0,
                    ),
                  ),
                ),

            )

              ],
            ),

            ListTile(
              title: Text('profile'),
              leading: Icon(
                Icons.account_circle,
                color: Colors.amber,
                size: 24.0,
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
              title: Text('History'),
              leading: Icon(
                Icons.history,
                color: Colors.amber,
                size: 24.0,
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
              title: Text('Balance'),
              leading: Icon(
                Icons.account_balance_wallet,
                color: Colors.amber,
                size: 24.0,
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
              title: Text('Notifications'),
              leading: Icon(
                Icons.notifications,
                color: Colors.amber,
                size: 24.0,
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
              title: Text('Language'),
              leading: Icon(
                Icons.language,
                color: Colors.amber,
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
                color: Colors.amber,
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
              title: Text('About Company'),
              leading: Icon(
                Icons.question_answer,
                color: Colors.amber,
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
