import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/screens/Information_Page/row_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/assets.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 0, 40),
              child: CircularButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(44, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.15),
                    child: Text(
                      "Basic protective measures against the new coronavirus",
                      style: headingStyle,
                    ),
                  ),
                  RowComponent(
                    imageWidget: Image.asset(
                      ImageAssets().informationPageIconOne,
                    ),
                    headingText: "Clean your hands often",
                    detailText:
                        "Wash hands often with soap \nand water for at least 20s",
                  ),
                  RowComponent(
                    imageWidget: Image.asset(
                      ImageAssets().informationPageIconTwo,
                    ),
                    headingText: "Wear a facemask",
                    detailText:
                        "You should wear facemask when \n you are around other people.",
                  ),
                  RowComponent(
                    imageWidget: Image.asset(
                      ImageAssets().informationPageIconThree,
                    ),
                    headingText: "Avoid touching your \nface",
                    detailText:
                        "Hands touch many surfaces and \ncan pick up viruses. ",
                  ),
                  RowComponent(
                    imageWidget: Image.asset(
                      ImageAssets().informationPageIconFour,
                    ),
                    headingText: "Avoid touching contact",
                    detailText:
                        "Put distance between yourself \nand other people.",
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

TextStyle headingStyle = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 28,
);
