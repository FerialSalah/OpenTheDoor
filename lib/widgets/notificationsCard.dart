import 'package:flutter/material.dart';


class NotificationsCard extends StatefulWidget {
  String title;
  String createdAt;
  NotificationsCard({this.title,this.createdAt});

  @override
  _NotificationsCardState createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color(0xFFC89C17),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Text("${widget.title}"),
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}
