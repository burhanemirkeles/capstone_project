// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomizedAlertDialog extends StatelessWidget {
  const CustomizedAlertDialog(
      {Key? key, required this.dialogTitle, this.content})
      : super(key: key);
  final String dialogTitle;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
    );
  }
}

//TODO: design a customized alert popup and imlement here.