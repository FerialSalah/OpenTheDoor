import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/notifications.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/widgets/notificationsCard.dart';

import '../localization.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Generalnotfication> notifications = new List();
  getNotificatiions() async {
    ApiProvider apiProvider = new ApiProvider();
    notifications = await apiProvider.getNotification();
  }

  @override
  void initState() {
    super.initState();
    getNotificatiions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).text('notifications')),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: notifications == null ? 0 : notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NotificationsCard(
                  title: notifications[index].notTitleAr,
                  createdAt:(notifications[index].createdAt).toString() ,
                ),
              );
            },
          ),
        ));
  }
}
