// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

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

  Future<void> getCurrentCity(
    FirebaseFirestore db,
    String email,
  ) async {
    try {
      final ref = db.collection("locationAndUserInfo").doc("email");
      final docSnap = await ref.get();
      final data = docSnap.data();
      final lat = data!['lat'];
      final lon = data['lon'];
      print(lat);
      print(lon);
    } catch (e) {
      print(e);
    }
  }

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
}
