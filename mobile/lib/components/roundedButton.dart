// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:capstone_project/constants';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color, textColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  const RoundedButton({
    key,
    required this.text,
    required this.onPress,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.textStyle,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: textStyle,
      ),
    );
  }
}
/*
TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
            */