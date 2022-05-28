import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsForDensityPage extends StatefulWidget {
  const GoogleMapsForDensityPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsForDensityPage> createState() =>
      _GoogleMapsForDensityPageState();
}

class _GoogleMapsForDensityPageState extends State<GoogleMapsForDensityPage> {
  @override
  Widget build(BuildContext context) {
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
}
