// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, camel_case_types

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/customTextLabelContainer.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/screens/Corona_Test_Page/coronaTestScreen.dart';
import 'package:capstone_project/screens/EU_Health_Passport_WV_page/eu_health_passport.dart';
import 'package:capstone_project/screens/Home_Page/Map/map_view.dart';
import 'package:capstone_project/screens/Home_Page/components/item_card.dart';
import 'package:capstone_project/screens/Information_Page/information_page.dart';
import 'package:capstone_project/screens/New_Pages/new_page_for_test.dart';
import 'package:capstone_project/screens/Vaccination_Page/vaccination_screen.dart';
import 'package:capstone_project/services/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:capstone_project/screens/Home_Page/components/itemCardConstants.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Location location = Location();
  String latitudeHomeScreen = " ";
  String longitudeHomeScreen = " ";
  double? latitudeDouble;
  double? longitudeDouble;
  String cityNameHomeScreen = " ";
  String areaName = " ";
  String vaccineInfoHomeScreen = " ";
  String? userEmailHomeScreen = " ";
  int? numberOfPeopleNotVaccinatedInArea = 0;
  int? numberOfPeopleVaccinatedWithBiontech = 0;
  int? numberOfPeopleVaccinatedWithSinovac = 0;
  int? vaccinationCountHomeScreen;
  Position? position;

  var database = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Location locationObj = Location();
  UserInfo userInfo = UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextLabelContainer(
                              childWidgetOne: Text(
                                  "Location: $latitudeHomeScreen - $longitudeHomeScreen \n$cityNameHomeScreen"),
                              childWidgetTwo: Text(""),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextLabelContainer(
                              childWidgetOne: Text("Vaccination: "),
                              childWidgetTwo: Text(
                                returnVaccinationInformation(
                                  vaccineInfoHomeScreen,
                                  vaccinationCountHomeScreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextLabelContainer(
                              childWidgetOne: Text(
                                "Around you:\n${numberOfPeopleNotVaccinatedInArea.toString()} people is not vaccinated!\n${numberOfPeopleVaccinatedWithBiontech.toString()} people vaccinated with Biontech\n${numberOfPeopleVaccinatedWithSinovac.toString()} people vaccinated with Sinovac",
                              ),
                              childWidgetTwo: Text(""),
                            ),
                          ),
                        ],
                      ),
                      RoundedButton(
                        text: "Get My Info",
                        onPress: () async {
                          await userInfo.getUserEmail(auth);
                          userEmailHomeScreen = userInfo.email;
                          print(userEmailHomeScreen);

                          await location.getCurrentLocation();
                          latitudeHomeScreen =
                              location.latitude.toString().substring(0, 6);
                          longitudeHomeScreen =
                              location.longitude.toString().substring(0, 6);
                          latitudeDouble = location.latitude;
                          longitudeDouble = location.longitude;

                          await location.getCurrentCity(
                            database,
                            userEmailHomeScreen!,
                            latitudeDouble,
                            longitudeDouble,
                          );
                          areaName = location.subAdminArea;
                          cityNameHomeScreen = location.cityName;

                          await userInfo.getVaccinationType(
                              database, userEmailHomeScreen);
                          vaccineInfoHomeScreen = userInfo.vaccinationType;

                          await location.sendLocationDataToFirestore(
                            database,
                            userEmailHomeScreen!,
                            location.latitude,
                            location.longitude,
                            cityNameHomeScreen,
                          );

                          await userInfo.getVaccinationCount(
                              database, userEmailHomeScreen);
                          vaccinationCountHomeScreen =
                              userInfo.vaccinationCount;

                          await sendDataToFireStore(
                            database,
                            userEmailHomeScreen!,
                            areaName,
                            vaccineInfoHomeScreen,
                          );

                          await location.getNumberOfPeopleInSameArea(
                            database,
                            areaName,
                            vaccineInfoHomeScreen,
                          );
                          numberOfPeopleNotVaccinatedInArea =
                              location.notVaccinatedCount;
                          numberOfPeopleVaccinatedWithBiontech =
                              location.vaccinatedWithBiontechCount;
                          numberOfPeopleVaccinatedWithSinovac =
                              location.vaccinatedWithSinovacCount;

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ), //const GoogleMapsMap(),
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                padding: const EdgeInsets.all(4),
                width: 384,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ItemCardConstants().coronaTestItemColor,
                  border: Border.all(
                    color: ItemCardConstants().coronaTestItemColor,
                    width: 5,
                  ),
                  //borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _itemCardOfCoronaTest(),
                _itemCardOfVaccination(),
                _itemCardOfClinic(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _itemCardOfEuInformation(),
                _itemCardOfInformation(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ItemCard _itemCardOfCoronaTest() {
    return ItemCard(
      routePage: const CoronaTestWebView(),
      image: Image.asset(ImageAssets().coronaIcon, alignment: Alignment.center),
      color: ItemCardConstants().coronaTestItemColor,
      widget: Text(
        "Corona Test",
        style: ItemCardConstants().textStyle,
      ),
    );
  }

  ItemCard _itemCardOfVaccination() {
    return ItemCard(
      routePage: const VaccinationPage(),
      image:
          Image.asset(ImageAssets().vaccineIcon, alignment: Alignment.center),
      color: ItemCardConstants().vaccinationItemColor,
      widget: Text(
        "Vaccination",
        style: ItemCardConstants().textStyle,
      ),
    );
  }

  ItemCard _itemCardOfClinic() {
    return ItemCard(
      routePage: const NewPage(),
      image: Image.asset(ImageAssets().clinicIcon, alignment: Alignment.center),
      color: ItemCardConstants().clinicItemColor,
      widget: Text(
        "Nearby Clinic",
        style: ItemCardConstants().textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  ItemCard _itemCardOfEuInformation() {
    return ItemCard(
      routePage: const EuHealthPassportWebView(),
      image: Image.asset(ImageAssets().euIcon, alignment: Alignment.center),
      color: ItemCardConstants().euItemColor,
      widget: Text(
        "EU Health \n Password",
        style: ItemCardConstants().textStyle,
      ),
    );
  }

  ItemCard _itemCardOfInformation() {
    return ItemCard(
      routePage: const InformationPage(),
      image: Image.asset(ImageAssets().informationIcon,
          alignment: Alignment.center),
      color: ItemCardConstants().informationItemColor,
      widget: Text(
        "Information",
        style: ItemCardConstants().textStyle,
      ),
    );
  }

  Future<void> sendDataToFireStore(
    FirebaseFirestore database,
    String email,
    String areaName,
    String vaccinationType,
  ) async {
    String mail = email;
    final newData = <String, dynamic>{
      "email": mail,
      "areaName": areaName,
      "vaccinationType": vaccinationType,
    };
    database
        .collection("locationAndUserInfo")
        .doc(email)
        .set(newData)
        .onError((e, _) => print("Error writing document: $e"));
  }

  String returnVaccinationInformation(
      String vaccinationType, int? numberOfDoses) {
    if (vaccinationType == "Sinovac") {
      return "Sinovac $numberOfDoses doses";
    } else if (vaccinationType == "PfizerBiontech") {
      return "Pfizer-Biontech $numberOfDoses doses";
    } else if (vaccinationType == "NotVaccinated") {
      return "Not Vaccinated!";
    } else {
      return "";
    }
  }
}

class UserInfo {
  late String? email;
  late String vaccinationType;
  late int? vaccinationCount;
  Future<void> getUserEmail(FirebaseAuth auth) async {
    try {
      email = auth.currentUser?.email.toString();
    } catch (e) {
      print("error happened when getting email data of current user");
    }
  }

  Future<void> getVaccinationType(
    FirebaseFirestore db,
    String? email,
  ) async {
    try {
      final ref = db.collection("users").doc(email);
      final docSnap = await ref.get();
      final data = docSnap.data();
      vaccinationType = data!['vaccination type'];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getVaccinationCount(
    FirebaseFirestore db,
    String? email,
  ) async {
    try {
      final ref = db.collection("users").doc(email);
      final docSnap = await ref.get();
      final data = docSnap.data();
      vaccinationCount = data!['vaccination count'];
    } catch (e) {
      print(e);
    }
  }
}
