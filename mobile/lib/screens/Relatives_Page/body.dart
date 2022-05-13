import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/screens/Relatives_Page/relative_card.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
            child: RelativesCard(
          relativeName: "Uğur Pamuk",
          covStatus: "Negative",
        )),
      ),
    );
  }
}
