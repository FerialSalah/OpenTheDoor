import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoder/geocoder.dart';

class MapViewScreen extends StatefulWidget {
  @override
  State<MapViewScreen> createState() => MapViewScreenState();
}

class MapViewScreenState extends State<MapViewScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Position currentPosition;
  var addresses;
  String address = "";
  CameraPosition myPostion = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414);

  bool isLoading;

  getCurrentLocation() async {
    currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    print(currentPosition.latitude);
    myPostion = CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 19.151926040649414);
    await search(currentPosition.latitude, currentPosition.longitude);
    setState(() {});
  }

  Future search(double longitude, double latitude) async {
    var first = addresses.first;
  //  final coordinates = new Coordinates(longitude, latitude);
  //  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    address = "${first.featureName} : ${first.addressLine}";
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: myPostion,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
