import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowComponent extends StatelessWidget {
  const RowComponent(
      {Key? key,
      required this.imageWidget,
      required this.headingText,
      required this.detailText})
      : super(key: key);
  final Widget imageWidget;
  final String headingText;
  final String detailText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingText,
                  style: headingStyle,
                ),
                Text(
                  detailText,
                  style: detailStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle detailStyle = GoogleFonts.poppins(
  fontSize: 13,
);

TextStyle headingStyle = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle headingTwoStyle = GoogleFonts.poppins(
  fontSize: 18,
);
