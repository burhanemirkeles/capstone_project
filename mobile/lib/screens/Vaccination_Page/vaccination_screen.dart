// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/model/vaccination_type.dart';
import 'package:capstone_project/screens/Vaccination_Page/informationBody.dart';
import 'package:capstone_project/screens/Vaccination_Page/vaccinationInfoConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({Key? key}) : super(key: key);

  @override
  State<VaccinationPage> createState() => _VaccinationPageState();
}

VaccinationTypeEnum vaccinationType = VaccinationTypeEnum.Sinovac;

class _VaccinationPageState extends State<VaccinationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            Center(
              child: Container(
                height: size.height * 0.71,
                width: size.width * 0.92,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30.32),
                    color: Color.fromRGBO(229, 229, 229, 1)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 160,
                            child: ListTile(
                              title: Text(
                                VaccinationTypeEnum.Sinovac.toShortString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              leading: Radio<VaccinationTypeEnum>(
                                value: VaccinationTypeEnum.Sinovac,
                                groupValue: vaccinationType,
                                hoverColor: Colors.black,
                                onChanged: (VaccinationTypeEnum? value) {
                                  setState(
                                    () {
                                      vaccinationType = value!;
                                      buildCustomWidget(vaccinationType);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: ListTile(
                              title: Text(
                                "Biontech",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              leading: Radio<VaccinationTypeEnum>(
                                  value: VaccinationTypeEnum.PfizerBiontech,
                                  groupValue: vaccinationType,
                                  onChanged: (VaccinationTypeEnum? value) {
                                    setState(() {
                                      vaccinationType = value!;
                                      buildCustomWidget(vaccinationType);
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildCustomWidget(vaccinationType),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomWidget(VaccinationTypeEnum vaccinationTypeEnum) {
    if (vaccinationTypeEnum == VaccinationTypeEnum.Sinovac) {
      return InformationBody(
        headingOne: SinovacInfoConstants().headingOne,
        manufacturer: SinovacInfoConstants().manufacturer,
        numberOfShots: SinovacInfoConstants().numberOfShots,
        boosterShots: SinovacInfoConstants().boosterShots,
        typeOfVaccine: SinovacInfoConstants().typeOfVaccine,
      );
    } else {
      return InformationBody(
        headingOne: BiontechInfoConstants().headingOne,
        manufacturer: BiontechInfoConstants().manufacturer,
        numberOfShots: BiontechInfoConstants().numberOfShots,
        boosterShots: BiontechInfoConstants().boosterShots,
        typeOfVaccine: BiontechInfoConstants().typeOfVaccine,
      );
    }
  }
}

Row _topBar(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,

    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 60, 0, 40),
        child: CircularButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text(
          "Vaccination Information",
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Color.fromRGBO(255, 154, 148, 1),
          ),
        ),
      ),
    ],
  );
}
