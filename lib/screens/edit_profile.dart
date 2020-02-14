import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../localization.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File _image;
  String linkImg = "";
  void openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      linkImg = _image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC89C17),
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).text('edit_profile')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 4),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: editProfileCard(context))
                ],
              ),
              Positioned(
                  top: 110,
                  left: 100,
                  right: 100,
                  child: Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        openGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child:ClipOval(
                          child:  _image == null
                              ? Icon(
                            Icons.account_circle,
                            color: Color(0xFFC89C17),
                            size: 80.0,
                          )
                              : Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        radius: 48.0,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget editProfileCard(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context).text("name"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon:
                    Icon(Icons.account_circle, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context).text("email"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.email, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            cursorColor: Color(0xFFC89C17),
            decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context).text("phone"),
                labelStyle: TextStyle(
                  color: Color(0xFFC89C17),
                ),
                hasFloatingPlaceholder: true,
                prefixIcon: Icon(Icons.phone_android, color: Color(0xFFC89C17)),
                counterStyle: TextStyle(color: Color(0xFFC89C17))),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            minWidth: 250.0,
            height: 10.0,
            child: Text(AppLocalizations.of(context).text("save")),
            color: Color(0xFFC89C17),
            textColor: Colors.white,
            padding: EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
