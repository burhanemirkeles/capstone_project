import 'package:capstone_project/screens/Home_Page/components/item_card.dart';
import 'package:capstone_project/screens/Home_Page/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: ItemCard(
      borderRadius: 25.0,
      routePage: HomePage(),
    ));
  }
}

//TODO: This file will contain the body of the home page viewed items.