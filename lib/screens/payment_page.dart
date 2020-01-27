import 'package:flutter/material.dart';

import '../localization.dart';



class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translateString('payment')),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translateString('payment_txt'),
                style: TextStyle(
                  color: Color(0xFFC89C17),
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context).translateString('balance'),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                minWidth: 250.0,
                height: 10.0,
                child: Text(AppLocalizations.of(context)
                    .translateString('request_money')),
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
        ));
  }
}
