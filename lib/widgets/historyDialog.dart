import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/serviceDetails.dart';
import 'package:flutter_openthedoor/screens/end_service_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogCard extends StatefulWidget {
  ServiceDetailsModel data;
  DialogCard({this.data});
  @override
  _DialogCardState createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogCard> {
  @override
  void initState() {
    startOrStop();
    super.initState();
  }

  Stopwatch watch = new Stopwatch();
  Timer timer;

  String elapsedTime = '';
  bool startStop = true;

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: Container(
        width: 500.0,
        height: 400.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: new Stack(
                    children: <Widget>[
                      Card(
                        child: Container(
                          height: 50.0,
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0.0, -0.6),
                        child: Align(
                          child: CircleAvatar(
                            radius: 45.0,
                            //child: Text("A"),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            backgroundColor: Color(0xFFC89C17),
                          ),
                          alignment: FractionalOffset(0.5, 0.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${widget.data.providerName}',
                    style: TextStyle(color: Color(0xFFC89C17), fontSize: 20.0),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Color(0xFFC89C17),
                        size: 30.0,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Service Rate',
                      style:
                          TextStyle(color: Color(0xFFC89C17), fontSize: 15.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RatingBar(
                      initialRating: (widget.data.ratCount).toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Color(0xFFC89C17),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Service Cost:',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${widget.data.providerPricePerHour} SAR/Hour',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Service Time:',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      elapsedTime,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 20.0,
              child: Text('End Service'),
              color: Color(0xFFC89C17),
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                stopWatch();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EndPage(data: widget.data)));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
