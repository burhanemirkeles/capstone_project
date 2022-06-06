// ignore_for_file: unused_import

import 'package:capstone_project/screens/Home_Page/Map/map_for_density_page.dart';
import 'package:capstone_project/screens/Home_Page/Map/map_view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const GoogleMapsMap();
  }
}
