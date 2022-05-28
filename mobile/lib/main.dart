// ignore_for_file: unused_import

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/screens/Main_Screen/main_screen.dart';
import 'package:capstone_project/screens/Relatives_Page/relatives_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid-19 Vaccine Tracker",
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}
