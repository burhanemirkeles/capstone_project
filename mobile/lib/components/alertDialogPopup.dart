// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomizedAlertDialog extends StatelessWidget {
  const CustomizedAlertDialog(
      {Key? key,
      required this.dialogTitle,
      this.content,
      required this.actions})
      : super(key: key);
  final String dialogTitle;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: content,
      actions: actions,
    );
  }
}

//TODO: design a customized alert popup and imlement here.

// Is this popup will be in os design(Android/Cupertino) or custom designed (same in two platforms)
//if it will be same design will be created as Customized Alert Dialog
//if it wont be same design will be created as two different AlertDialogs and choosed in CustomizedAlertDialog widget with an if statement
/*
!! builder is the property of button
builder: (BuildContext context) showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      )
*/