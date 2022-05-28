import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/screens/EU_Health_Passport_WV_page/eu_health_passport.dart';
import 'package:capstone_project/screens/Home_Page/Map/map_view.dart';
import 'package:capstone_project/screens/Home_Page/components/item_card.dart';
import 'package:capstone_project/screens/New_Pages/new_page_for_test.dart';
import 'package:flutter/material.dart';
import "package:capstone_project/screens/Home_Page/components/itemCardConstants.dart";

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Container(
                  child: const GoogleMapsMap(),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                width: 384,
                height: 280,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(35),
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
      routePage: const NewPage(),
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
      routePage: const NewPage(),
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
      routePage: const NewPage(),
      image: Image.asset(ImageAssets().informationIcon,
          alignment: Alignment.center),
      color: ItemCardConstants().informationItemColor,
      widget: Text(
        "Information",
        style: ItemCardConstants().textStyle,
      ),
    );
  }
}
