// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';

class Location {
  late double latitude;
  late double longitude;
  late String cityName;
  late String subAdminArea;
  late int? notVaccinatedCount;
  late int? vaccinatedWithBiontechCount;
  late int? vaccinatedWithSinovacCount;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("error happened when getting location data");
    }
  }

  Future<void> getCurrentCity(
    FirebaseFirestore db,
    String email,
    double? latitude,
    double? longitude,
  ) async {
    try {
      final Coordinates coordinates = Coordinates(latitude, longitude);
      final address =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      subAdminArea = address.first.subAdminArea;
      final thoroughfare = address.first.thoroughfare;
      cityName = thoroughfare + ", " + subAdminArea;
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendLocationDataToFirestore(
    FirebaseFirestore database,
    String email,
    double latitude,
    double longitude,
    String cityName,
  ) async {
    double lat = latitude;
    double lon = longitude;
    String mail = email;
    final newData = <String, dynamic>{
      "lat": lat,
      "lon": lon,
      "cityName": cityName,
      "email": mail,
    };
    database
        .collection("locationAndUserInfo")
        .doc(email)
        .set(newData)
        .onError((e, _) => print("Error writing document: $e"));
  }

  Future<void> getNumberOfPeopleInSameArea(FirebaseFirestore database,
      String areaName, String vaccinationType) async {
    final notVaccinated = database
        .collection("locationAndUserInfo")
        .where("areaName", isEqualTo: areaName)
        .where("vaccinationType", isEqualTo: "NotVaccinated");
    final snaphot = await notVaccinated.get();
    notVaccinatedCount = snaphot.size;

    final vaccinatedWithBiontech = database
        .collection("locationAndUserInfo")
        .where("areaName", isEqualTo: areaName)
        .where("vaccinationType", isEqualTo: "PfizerBiontech");
    final snaphot1 = await vaccinatedWithBiontech.get();
    vaccinatedWithBiontechCount = snaphot1.size;

    final vaccinatedWithSinovac = database
        .collection("locationAndUserInfo")
        .where("areaName", isEqualTo: areaName)
        .where("vaccinationType", isEqualTo: "Sinovac");
    final snaphot2 = await vaccinatedWithSinovac.get();
    vaccinatedWithSinovacCount = snaphot2.size;
  }
}
