// ignore_for_file: prefer_const_constructors

import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/screens/Relatives_Page/relative_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final auth = FirebaseAuth.instance;

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textOfPage(),
              Container(
                width: 384,
                height: 450,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30.32),
                  color: Color.fromARGB(255, 231, 170, 170),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: const [
                        RelativesCard(
                          covStatus: "Sinovac 3 doses",
                          relativeName: "Orhan Keleş",
                        ),
                        RelativesCard(
                          covStatus: "PfizerBiontech 2 doses",
                          relativeName: "Ömer Keleş",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textOfPage() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
    child: Text(
      "Relatives",
      style: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(255, 154, 148, 1),
      ),
    ),
  );
}
