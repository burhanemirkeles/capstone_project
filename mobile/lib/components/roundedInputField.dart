// ignore_for_file: file_names, unused_import

import 'package:capstone_project/Constants.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/components/textFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isObscure;
  final TextEditingController? controller;
  final Widget? child;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.isObscure,
      this.controller,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isObscure,
        onChanged: onChanged,
        cursorColor: const Color.fromARGB(255, 0, 0, 0),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color(0xFF6F35A5),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        controller: controller,
        //keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
