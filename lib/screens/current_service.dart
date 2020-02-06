import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class HistoryCard extends StatelessWidget {
  HistoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text('provider 1 '),
                CircleAvatar(

                  backgroundColor: Colors.brown.shade800,
                  child: Text('AH'),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.amber,
                ),
                Text('خدمة 1'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                Text('تم الموافقة من قبل المزود'),
                Text('10 ريال/ساعة'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                Text(' مسافة الوصول(1)متر'),
              ],
            ),
            ButtonBar(

              children: <Widget>[
                FlatButton(
                  color: Colors.amber,
                  textColor: Colors.white,
                  child: const Text('إبدأ الخدمة'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  color: Colors.amber,
                  textColor: Colors.white,
                  child: const Text('إلغاء الخدمة'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}