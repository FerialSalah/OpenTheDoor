import 'package:flutter/material.dart';

import 'drawer.dart';

class SelectProvider extends StatefulWidget {
  @override
  _SelectProviderState createState() => _SelectProviderState();
}

class _SelectProviderState extends State<SelectProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }),
      ),
      body: Center(

        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                "لايوجد مساعدين",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              SizedBox(
                height: 10.0,
              ),
              // MaterialButton(
              //   minWidth: 300.0,
              //   height: 20.0,
              //   child: Text(""),
              //   color: Color(0xFFC89C17),
              //   textColor: Colors.white,
              //   padding:
              //   EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5)),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),

      )
    ,
    );
  }
}
