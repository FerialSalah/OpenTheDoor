import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Helpers {
  static File selectedImg;
  static ImageSource imageSource;

///////////////////////////////////////
  static getImageSource(BuildContext context) async {
    imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: Text('اختيار من :'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.camera_alt),
                          Text('الكاميرا'),
                        ],
                      ),
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                    ),
                    MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.photo),
                          Text('المعرض'),
                        ],
                      ),
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.gallery),
                    )
                  ],
                ),
              ],
            ));
  }

  static Future getImage(ImageSource src) async {
    selectedImg = await ImagePicker.pickImage(source: src);
  }

  static File selectImg(BuildContext context) {
    getImageSource(context).then((value) async {
      await getImage(imageSource);
    });

    return selectedImg;
  }

  static void showTheDialog(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title == null ? "" : title),
          content: new Text(body == null ? "" : body),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static bool emailvalidator(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
