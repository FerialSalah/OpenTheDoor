
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: TestImage(),

    );
  }
}

class TestImage extends StatefulWidget {
  @override
  _TestImageState createState() => _TestImageState();
}

class _TestImageState extends State<TestImage> {
  File galleryFile;


  imageSelectorGallery()async{
    galleryFile=await ImagePicker.pickImage(source: ImageSource.gallery,maxHeight: 50.0,maxWidth: 50.0);
    
    print('you slectected gallery image'+galleryFile.path);
    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           child: Column(
             children: <Widget>[
               FlatButton(onPressed:(){
                 imageSelectorGallery();

               } , child: Text('Select Image From Gallery'
               )),
               Image.file(galleryFile,height: 100.0,width: 200.0,)
             ],
           )

         )
    );
  }
}
