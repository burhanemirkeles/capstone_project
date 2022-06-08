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
    // ignore: unused_local_variable
    const double widthCo =
        0.8792; //This coefficient calculated due to design file. Designed width/Screen width
    const double widthRenew =
        0.7998; //This width coefficient created due to a design error, container & cards has a intersection on top of secren when user slides up
    const double heightCo =
        0.10267; //This coefficient calculated due to design file. Designed height/Screen height
    return Container(
      height: size.height * heightCo,
      width: size.width * widthRenew,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30.32),
        color: backgroundColor,
      ),
      margin: const EdgeInsets.fromLTRB(0, 14, 10, 0),
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
            "Vaccine Status: $covStatus",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
