// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';

class Location {
  /*
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
*/
/*
  Future<void> getCurrentCity(
    FirebaseFirestore db,
    String email,
  ) async {
    try {
      final ref = db.collection("locationAndUserInfo").doc("email");
      final docSnap = await ref.get();
      final data = docSnap.data();
      latitude = data!['lat'];
      longitude = data['lon'];
      final Coordinates coordinates = Coordinates(latitude, longitude);
      final address =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = address.first.addressLine;
      print(first);

      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }
*/
/*
  Future<void> sendLocationDataToFirestore(
    FirebaseFirestore database,
    String email,
    double latitude,
    double longitude,
  ) async {
    double lat = latitude;
    double lon = longitude;
    String mail = email;
    final newData = <String, dynamic>{
      "lat": lat,
      "lon": lon,
      "email": mail,
    };
    database
        .collection("locationAndUserInfo")
        .doc(email)
        .set(newData)
        .onError((e, _) => print("Error writing document: $e"));
  }
  */
}
