import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/screens/Home_Page/components/item_card.dart';
import 'package:capstone_project/screens/Home_Page/home_screen.dart';
import 'package:capstone_project/screens/New_Pages/new_page_for_test.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ItemCard(
      borderRadius: 30.32,
      routePage: const NewPage(),
      heightMultiplier: 0.13032,
      widthMultiplier: 0.28295,
      image: Image.asset(ImageAssets().iconCorona, alignment: Alignment.center),
      color: const Color.fromRGBO(255, 154, 148, 1),
      text: Text("Corona Test"),
    ));
  }
}

//TODO: This file will contain the body of the home page viewed items.