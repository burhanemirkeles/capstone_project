// ignore_for_file: unused_import

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/screens/Home_Page/home_screen.dart';
import 'package:capstone_project/screens/Information_Page/information_page.dart';
import 'package:capstone_project/screens/Login_Screen/login_screen.dart';
import 'package:capstone_project/screens/Main_Screen/main_screen.dart';
import 'package:capstone_project/screens/Relatives_Page/relatives_screen.dart';
import 'package:capstone_project/screens/Signup_Screen/signup_screen.dart';
import 'package:capstone_project/screens/Welcome_Screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
