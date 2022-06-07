// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'dart:async';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("error");
    }
  }
}
