import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RelativesCard extends StatelessWidget {
  const RelativesCard({
    Key? key,
    this.backgroundColor = const Color.fromRGBO(150, 179, 255, 1),
    this.relativeName,
    this.covStatus,
  }) : super(key: key);
  final Color? backgroundColor;
  final String? relativeName;
  final String? covStatus;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const double widthCo =
        0.8792; //This coefficient calculated due to design file. Designed width/Screen width
    const double heightCo =
        0.10267; //This coefficient calculated due to design file. Designed height/Screen height
    return Container(
      height: size.height * heightCo,
      width: size.width * widthCo,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30.32),
        color: backgroundColor,
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              relativeName!,
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Covid Status: $covStatus",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
