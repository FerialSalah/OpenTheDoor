import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/chooselanguage_screen.dart';
import 'package:flutter_openthedoor/screens/splah.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashPage(), routes: <String,WidgetBuilder>{
'/ChooseLanguage':(BuildContext context) => ChooseLanguage(),
}
));

