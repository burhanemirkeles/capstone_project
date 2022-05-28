import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsMap extends StatefulWidget {
  const GoogleMapsMap({Key? key}) : super(key: key);

  @override
  State<GoogleMapsMap> createState() => GoogleMapsMapState();
}

class GoogleMapsMapState extends State<GoogleMapsMap> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    const CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    return const Center(
      child: GoogleMap(
        initialCameraPosition: _kLake,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
      ),
    );
  }
}

// ignore: unused_element
GoogleMap _googleMaps() {
  const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  return const GoogleMap(
    initialCameraPosition: _kLake,
    zoomControlsEnabled: true,
    zoomGesturesEnabled: true,
    scrollGesturesEnabled: true,
  );
}
