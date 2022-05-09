import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/screens/Home_Page/components/item_card.dart';
import 'package:capstone_project/screens/New_Pages/new_page_for_test.dart';
import 'package:flutter/material.dart';
import "package:capstone_project/screens/Home_Page/components/itemCardConstants.dart";

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _itemCardOfCoronaTest(),
        _itemCardOfVaccination(),
        _itemCardOfClinic(),
        _itemCardOfEuInformation(),
        _itemCardOfInformation(),
      ],
    ));
  }

  ItemCard _itemCardOfCoronaTest() {
    return ItemCard(
      borderRadius: 30.32,
      routePage: const NewPage(),
      heightMultiplier: ItemCardConstants().heightMultiplier,
      widthMultiplier: ItemCardConstants().widthMultiplier,
      image: Image.asset(ImageAssets().coronaIcon, alignment: Alignment.center),
      color: ItemCardConstants().coronaTestItemColor,
      text: const Text("Corona Test"),
    );
  }

  ItemCard _itemCardOfVaccination() {
    return ItemCard(
      borderRadius: ItemCardConstants().borderRadius,
      routePage: const NewPage(),
      heightMultiplier: ItemCardConstants().heightMultiplier,
      widthMultiplier: ItemCardConstants().widthMultiplier,
      image:
          Image.asset(ImageAssets().vaccineIcon, alignment: Alignment.center),
      color: ItemCardConstants().vaccinationItemColor,
      text: const Text("Vaccination"),
    );
  }

  ItemCard _itemCardOfClinic() {
    return ItemCard(
      borderRadius: ItemCardConstants().borderRadius,
      routePage: const NewPage(),
      heightMultiplier: ItemCardConstants().heightMultiplier,
      widthMultiplier: ItemCardConstants().widthMultiplier,
      image: Image.asset(ImageAssets().clinicIcon, alignment: Alignment.center),
      color: ItemCardConstants().clinicItemColor,
      text: const Text(
        "Nearby Clinic",
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  ItemCard _itemCardOfEuInformation() {
    return ItemCard(
      borderRadius: ItemCardConstants().borderRadius,
      routePage: const NewPage(),
      heightMultiplier: ItemCardConstants().heightMultiplier,
      widthMultiplier: ItemCardConstants().widthMultiplier,
      image: Image.asset(ImageAssets().euIcon, alignment: Alignment.center),
      color: ItemCardConstants().euItemColor,
      text: const Text(
        "EU Health Passaport",
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );
  }

  ItemCard _itemCardOfInformation() {
    return ItemCard(
      borderRadius: ItemCardConstants().borderRadius,
      routePage: const NewPage(),
      heightMultiplier: ItemCardConstants().heightMultiplier,
      widthMultiplier: ItemCardConstants().widthMultiplier,
      image: Image.asset(ImageAssets().informationIcon,
          alignment: Alignment.center),
      color: ItemCardConstants().informationItemColor,
      text: const Text(
        "Information",
      ),
    );
  }
}

//TODO: This file will contain the body of the home page viewed items.