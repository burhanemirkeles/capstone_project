// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationBody extends StatelessWidget {
  final String headingOne;
  final String manufacturer;
  final String numberOfShots;
  final String boosterShots;
  final String typeOfVaccine;
  const InformationBody({
    Key? key,
    required this.headingOne,
    required this.manufacturer,
    required this.numberOfShots,
    required this.boosterShots,
    required this.typeOfVaccine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              headingOne,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 25,
                color: const Color.fromRGBO(255, 154, 148, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              manufacturerRichText(),
              numberOfShotsRichText(),
              boosterShotsRichText(),
              typeOfVaccineRichText(),
            ],
          ),
        ],
      ),
    );
  }

  RichText manufacturerRichText() {
    return RichText(
      text: TextSpan(
        style: constTextStyleOfBody(),
        children: <TextSpan>[
          TextSpan(
            text: "Manufacturer: ",
            style: constTextStyleOfBodyBold(),
          ),
          TextSpan(text: manufacturer),
        ],
      ),
    );
  }

  RichText numberOfShotsRichText() {
    return RichText(
      text: TextSpan(
        style: constTextStyleOfBody(),
        children: <TextSpan>[
          TextSpan(
            text: "Number of Shots: ",
            style: constTextStyleOfBodyBold(),
          ),
          TextSpan(text: numberOfShots),
        ],
      ),
    );
  }

  RichText boosterShotsRichText() {
    return RichText(
      text: TextSpan(
        style: constTextStyleOfBody(),
        children: <TextSpan>[
          TextSpan(
            text: "Booster Shots: ",
            style: constTextStyleOfBodyBold(),
          ),
          TextSpan(text: boosterShots),
        ],
      ),
    );
  }

  RichText typeOfVaccineRichText() {
    return RichText(
      text: TextSpan(
        style: constTextStyleOfBody(),
        children: <TextSpan>[
          TextSpan(
            text: "Type of Vaccine: ",
            style: constTextStyleOfBodyBold(),
          ),
          TextSpan(text: typeOfVaccine),
        ],
      ),
    );
  }
}

TextStyle constTextStyleOfBody() {
  return GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.black,
  );
}

TextStyle constTextStyleOfBodyBold() {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
  );
}
