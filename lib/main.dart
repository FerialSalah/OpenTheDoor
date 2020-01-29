import 'package:flutter/material.dart';
import 'screens/chooselanguage_screen.dart';
import 'screens/splah.dart';



void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashPage(), routes: <String,WidgetBuilder>{
'/ChooseLanguage':(BuildContext context) => ChooseLanguage(),
}
));

