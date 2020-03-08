import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/serviceDetails.dart';
import 'package:flutter_openthedoor/screens/end_service_page.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/widgets/historyDialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InProcessScreen extends StatefulWidget {
  List<ServiceDetailsModel> list = new List();
  InProcessScreen({this.list});
  @override
  _InProcessScreenState createState() => _InProcessScreenState();
}

class _InProcessScreenState extends State<InProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list == null ? 0 : widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              showDialog(
                  context: context,
                  builder: (_) {
                    return DialogCard(data:widget.list[index]);
                  });
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Color(0xFFC89C17),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        Text('${widget.list[index].providerName}'),
                        RatingBar(
                          initialRating:
                              (widget.list[index].ratCount).toDouble(),
                          //  minRating: 1,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(
                                    0xFFC89C17,
                                  ),
                                  width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text(
                            '${widget.list[index].status}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${widget.list[index].providerPricePerHour} SAR/Hour',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                            'The arrival in ${widget.list[index].providerMinutesToArrive} Minutes. '),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 150,
                          height: 40,
                          color: Color(0xFFC89C17),
                          textColor: Colors.white,
                          child: const Text('Start Service'),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            ApiProvider api = new ApiProvider();
                            try {
                              api.editorder(
                                  userId: prefs.getInt("id"),
                                  providerId: widget.list[index].providerId,
                                  status: "inprocess");
                            } catch (e) {
                              print(e.response);
                            }
                          },
                        ),
                        MaterialButton(
                          minWidth: 100,
                          height: 40,
                          color: Color(0xFFC89C17),
                          textColor: Colors.white,
                          child: const Text('Cancel Service'),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            ApiProvider api = new ApiProvider();
                            api.editorder(
                                userId: prefs.getInt("id"),
                                providerId: widget.list[index].providerId,
                                status: "canceled");
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
