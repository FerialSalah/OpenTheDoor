import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/activation_code.dart';
import 'package:flutter_openthedoor/screens/sign_in.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../localization.dart';

Widget phoneTextFiled(BuildContext context) {
  return Row(
    children: <Widget>[
      Text(
        '966',
      ),
      SizedBox(
        width: 5,
      ),
      new Flexible(
        child: TextFormField(
          // validator: ,

          keyboardType: TextInputType.phone,
          cursorColor: Color(0xFFC89C17),
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).translateString('phone'),
              labelStyle: TextStyle(
                color: Color(0xFFC89C17),
              ),
              hasFloatingPlaceholder: true,
              prefixIcon: Icon(Icons.phone_android, color: Color(0xFFC89C17)),
              counterStyle: TextStyle(color: Color(0xFFC89C17))),
        ),
      ),
    ],
  );
}

Positioned positioned = Positioned(
    top: 110,
    left: 100,
    right: 100,
    child: Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50.0,
        child: Icon(
          Icons.lock,
          color: Color(0xFFC89C17),
        ),
      ),
    ));
Widget passwordTextFiled(BuildContext context) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: AppLocalizations.of(context).translateString('password_txt'),
      hasFloatingPlaceholder: true,
      prefixIcon: Icon(
        Icons.lock,
        color: Color(0xFFC89C17),
      ),
    ),
  );
}

Widget continueButton(BuildContext context) {
  return FlatButton(
    child: Text(AppLocalizations.of(context).translateString('continue')),
    color: Color(0xFFC89C17),
    textColor: Colors.white,
    padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ActivationCodePage()));
    },
  );
}

Widget cardSignUp(BuildContext context) {
  return 
  
  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
              child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '966',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextFormField(
                      // validator: ,

                      keyboardType: TextInputType.phone,
                      cursorColor: Color(0xFFC89C17),
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translateString('phone'),
                          labelStyle: TextStyle(
                            color: Color(0xFFC89C17),
                          ),
                          hasFloatingPlaceholder: true,
                          prefixIcon:
                              Icon(Icons.phone_android, color: Color(0xFFC89C17)),
                          counterStyle: TextStyle(color: Color(0xFFC89C17))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              continueButton(context),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppLocalizations.of(context)
                        .translateString("don't_have_account"),
                    style: TextStyle(color: Colors.black),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    textColor: Color(0xFFC89C17),
                    child: Text(AppLocalizations.of(context)
                        .translateString('btn_login')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
class HistoryCard extends StatelessWidget {
  HistoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text('provider 1 '),
                CircleAvatar(

                  backgroundColor: Colors.brown.shade800,
                  child: Text('AH'),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.amber,
                ),
                Text('خدمة 1'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                Text('تم الموافقة من قبل المزود'),
                Text('10 ريال/ساعة'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                Text(' مسافة الوصول(1)متر'),
              ],
            ),
            ButtonBar(

              children: <Widget>[
                FlatButton(
                  color: Colors.amber,
                  textColor: Colors.white,
                  child: const Text('إبدأ الخدمة'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  color: Colors.amber,
                  textColor: Colors.white,
                  child: const Text('إلغاء الخدمة'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}