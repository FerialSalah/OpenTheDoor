import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/providerDetails.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProviderCard extends StatefulWidget {
  int id;
  int price;
  String name;
  int rating;
  String img;
  ProviderCard({this.id, this.name, this.rating, this.img,this.price});

  @override
  _ProviderCardState createState() => _ProviderCardState();
}

class _ProviderCardState extends State<ProviderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProviderDeatils(
                      id: widget.id,
                      rating: widget.rating,
                      servicePrice: widget.price,
                    )));
      },
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
                    radius: 40.0,
                    backgroundColor: Color(0xFFC89C17),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  Text("${widget.name}"),
                  RatingBar(
                    initialRating: widget.rating == null
                        ? 0.0
                        : (widget.rating).toDouble(),
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
          ],
        ),
      ),
    );
  }
}
