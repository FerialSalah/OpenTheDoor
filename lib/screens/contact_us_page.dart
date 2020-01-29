import 'package:flutter/material.dart';
import '../localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:async/async.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String _phone = '966580821888';

  Future<void> _makeUrlAction(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translateString('contact_us')),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.phone_android,
                color: Color(0xFFC89C17),
              ),
              title:
                  Text(AppLocalizations.of(context).translateString('phone')),
              subtitle: Text(
                '966580821888',
              ),
              trailing: Ink(
                decoration: BoxDecoration(
                  color: Color(0xFFC89C17),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  //This keeps the splash effect within the circle
                  borderRadius: BorderRadius.circular(
                      100.0), //Something large to ensure a circle

                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.phone,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      _makeUrlAction('tel:$_phone');
                    });

                  },
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Color(0xFFC89C17),
              ),
              title:
                  Text(AppLocalizations.of(context).translateString('address')),
              subtitle: Text('Streets, City, Country'),
            ),
            ListTile(
              leading: Icon(
                Icons.public,
                color: Color(0xFFC89C17),
              ),
              title:
                  Text(AppLocalizations.of(context).translateString('website')),
              subtitle: Text(
                'http://openthedoor.tawartec.com',
              ),
              trailing: Ink(
                decoration: BoxDecoration(
                  color: Color(0xFFC89C17),
                  shape: BoxShape.circle,
                ),
                child: InkWell(

                  borderRadius: BorderRadius.circular(
                      100.0),

                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.public,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: (){

                    setState(() {
                      _makeUrlAction('http://openthedoor.tawartec.com');
                    });
                  },
                ),
              ),
            )
          ],
        ));
  }
}
