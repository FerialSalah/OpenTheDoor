import 'package:flutter/material.dart';
import 'sign_in.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC89C17),
        appBar: AppBar(
            title: Text('Choose Language'),
            backgroundColor: Color(0xFFC89C17),
            centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:()=> Navigator.pop(context,false)),
            ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/openthedoor_logo.png',),

              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen ()))
              },
                  textColor: Color(0xFFC89C17),
                  color: Colors.white,
                  height: 40,
                  minWidth: 280,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(5.0),
                  child: Text('English',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(

                  onPressed: () => {},
                  color: Colors.white,
                  textColor: Color(0xFFC89C17),
                  height: 40,
                  minWidth: 280,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(5.0),
                  child: Text('العربية',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                ),
              )
            ],
          ),
        ));
  }
}
