// ignore_for_file: file_names

import 'package:capstone_project/Constants.dart';
import 'package:flutter/material.dart';

class CustomTextLabelContainer extends StatefulWidget {
  final Widget? childWidgetOne;
  final Widget? childWidgetTwo;
  const CustomTextLabelContainer({
    Key? key,
    required this.childWidgetOne,
    required this.childWidgetTwo,
  }) : super(key: key);

  @override
  State<CustomTextLabelContainer> createState() =>
      _CustomTextLabelContainerState();
}

class _CustomTextLabelContainerState extends State<CustomTextLabelContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.all(15),
      //width: 160,
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            widget.childWidgetOne!,
            widget.childWidgetTwo!,
          ],
        ),
      ),
    );
  }
}
