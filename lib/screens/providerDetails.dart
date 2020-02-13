import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/provider.dart';
import 'package:flutter_openthedoor/screens/drawer.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderDeatils extends StatefulWidget {
  int id;
  int rating;
  int servicePrice;

  ProviderDeatils({this.id, this.rating, this.servicePrice});
  @override
  _ProviderDeatilsState createState() => _ProviderDeatilsState();
}

class _ProviderDeatilsState extends State<ProviderDeatils> {
  Provider provider;
  bool isLoading = true;

  Future<void> _makeUrlAction(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    getProviderDetails();
  }

  getProviderDetails() async {
    ApiProvider api = new ApiProvider();
    provider = await api.getProviderDetails(widget.id);
    isLoading = false;
    print("${ApiProvider.baseUrl}${provider.image}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xFFC89C17),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.yellow),
              ),
            )
          : ListView(
              children: <Widget>[
                Card(
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
                              backgroundImage: NetworkImage(provider == null ||
                                      provider.image == null
                                  ? ""
                                  : "${ApiProvider.baseUrl}${provider.image}"),
                              child: provider == null || provider.image == null
                                  ? Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                      size: 50.0,
                                    )
                                  : Image(image: NetworkImage(provider.image)),
                            ),
                            Text('${provider.name}'),
                            RatingBar(
                              initialRating: (widget.rating).toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 25.0,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('Information About Provider:'),
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Gender:${provider.gender}'),
                        ],
                      ),
                      Text(
                          'resident number or status card:${provider.residentnumberorstatuscard}'),
                      Text('Information About Provider:'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              '${widget.servicePrice} SAR/Hour',
                              style: TextStyle(fontSize: 15.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('The arrival distance is 1 meter'),
                            IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: Color(0xFFC89C17),
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  _makeUrlAction("tel:${provider.phone}");
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          minWidth: 150,
                          height: 40,
                          color: Color(0xFFC89C17),
                          textColor: Colors.white,
                          child: const Text('Start Service'),
                          onPressed: () async {
                            try {
                              isLoading = true;
                              setState(() {});
                              ApiProvider api = new ApiProvider();
                              await api.makeOrder(provider.id);
                            } catch (e) {
                              print(e);
                            } finally {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
