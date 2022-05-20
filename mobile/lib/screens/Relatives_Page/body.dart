import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/screens/Relatives_Page/relative_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textOfPage(),
            Container(
              width: 384,
              height: 646,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30.32),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  Column(
                    children: const [
                      RelativesCard(
                        relativeName: "Uğur Pamuk",
                        covStatus: "Negative",
                      ),
                      RelativesCard(
                        relativeName: "Hülya Pamuk",
                        covStatus: "Negative",
                      ),
                      RelativesCard(
                        relativeName: "Alp Pamuk",
                        covStatus: "Negative",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
