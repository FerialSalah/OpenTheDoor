import 'package:flutter/material.dart';

import '../localization.dart';
class PromoCodeScreen extends StatefulWidget {
  @override
  _PromoCodeScreenState createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
        Text(AppLocalizations.of(context).translateString('promo_code')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: Center(

        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translateString('enter_your_promo_code'),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType. text,
                cursorColor: Color(0xFFC89C17),
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translateString("promo_code"),
                    labelStyle: TextStyle(
                      color: Color(0xFFC89C17),

                    ),
                    hasFloatingPlaceholder: true,
                    counterStyle: TextStyle(color: Color(0xFFC89C17))),

              ),
              SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                minWidth: 300.0,
                height: 20.0,
                child: Text(AppLocalizations.of(context)
                    .translateString('get_your_gift')),
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

      )
    
    );
  }
}
