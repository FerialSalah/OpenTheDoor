import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HistoryCard extends StatefulWidget {
  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
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
                  radius: 50.0,
                  backgroundColor: Color(0xFFC89C17),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                Text('provider 1 '),
                RatingBar(
                  //  initialRating: 3,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Information About Provider:'),
                ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '10 SAR/Hour',
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
                Text('The arrival distance is 1 meter'),
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
                  onPressed: () {},
                ),
                MaterialButton(
                  minWidth: 100,
                  height: 40,
                  color: Color(0xFFC89C17),
                  textColor: Colors.white,
                  child: const Text('Cancel Service'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
