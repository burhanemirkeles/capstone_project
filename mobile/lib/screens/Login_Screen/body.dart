// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone_project/components/roundedInputField.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPictureForLogo(size),
            SizedBox(height: size.height * 0.03),
            InputFieldForEmail(),
            InputFieldForPassword(),
            LoginButton(),
          ],
        ),
      ),
    );
  }

  Widget SvgPictureForLogo(Size size) {
    return SvgPicture.asset(
      "assets/icons/login.svg",
      height: size.height * 0.35,
    );
  }

  Widget InputFieldForEmail() {
    return RoundedInputField(
        isObscure: false, hintText: "Your Email", onChanged: (value) {});
  }

  RoundedInputField InputFieldForPassword() {
    return RoundedInputField(
        isObscure: true, hintText: "Your Password", onChanged: (value) {});
  }

  RoundedButton LoginButton() {
    return RoundedButton(
      text: "LOGIN",
      onPress: () {},
    );
  }
}
