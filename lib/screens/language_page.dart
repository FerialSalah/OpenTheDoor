import 'package:flutter/material.dart';

import '../localization.dart';
class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('language')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: (){
             // Navigator.pop(context);
              setState(() {
                createAlertDialog(context);
                print('ok');
              });


            },

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100.0,
                decoration:BoxDecoration(border: Border.all(color: Colors.black26)),
                child: ListTile(
                  title: Text(AppLocalizations.of(context).translateString('language'),style: TextStyle(fontSize: 20.0),),
                  subtitle: Text(AppLocalizations.of(context).translateString('english'),style: TextStyle(fontSize: 18.0)),
                  trailing:Icon(Icons.keyboard_arrow_right,size: 30.0,),
                ),
              ),
            ),

          ),
        ],

      ),
    );
  }


}

createAlertDialog(BuildContext context) {
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(

        title: new Text("Language"),
        content:Container(
          width: 200.0,
          height: 50.0,
          child: new Column(
            children: <Widget>[
              new Text("English"),
              new Text("Arabic"),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("ok"),
            onPressed: () {
              //  Navigator.of(context).pop();
            },
          ),
        ],

      );

    });


}


