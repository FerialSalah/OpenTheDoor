import 'package:flutter/material.dart';
import 'chooselanguage_screen.dart';
import 'splah.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashPage(), routes: <String,WidgetBuilder>{
'/ChooseLanguage':(BuildContext context) => ChooseLanguage(),
}
));

