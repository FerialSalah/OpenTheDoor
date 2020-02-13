import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/screens/selectProvider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class MapViewScreen extends StatefulWidget {
  @override
  State<MapViewScreen> createState() => MapViewScreenState();
}

class MapViewScreenState extends State<MapViewScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Position currentPosition;
  var addresses;
  String address = "";
  static LatLng postion = LatLng(0, 0);
  CameraPosition myPostion =
      CameraPosition(target: postion, zoom: 19.151926040649414);

  Set<Marker> markers = Set();

  bool isLoading;
  static final MarkerId markerId = MarkerId("id");

  static Marker marker = Marker(
    markerId: markerId,
    position: postion,
    onTap: () {
      // _onMarkerTapped(markerId);
    },
  );

  getCurrentLocation() async {
    currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(currentPosition.latitude);
    postion = LatLng(currentPosition.latitude, currentPosition.longitude);
    myPostion = CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 19.151926040649414);
    markers.addAll([Marker(markerId: MarkerId('value'), position: postion)]);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myPostion));
    await search(currentPosition.latitude, currentPosition.longitude);
    setState(() {});
  }

  Future search(double longitude, double latitude) async {
   var first;
  //  final coordinates = new Coordinates(longitude, latitude);
  //  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    //first = addresses.first;
    final coordinates = new Coordinates(longitude, latitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //  var first = addresses.first;
    address = "${first.featureName} : ${first.addressLine}";
    print(address);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentLocation();
          
        },
        child: Icon(Icons.location_searching),
        backgroundColor: Colors.yellow,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: myPostion,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '${addresses == null ? "" : addresses.first.addressLine}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: FlatButton(
                  child: Text("اختار خدمة"),
                  color: Color(0xFFC89C17),
                  textColor: Colors.white,
                  padding:
                      EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectProvider()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
