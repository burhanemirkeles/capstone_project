// ignore_for_file: non_constant_identifier_names, duplicate_ignore, use_key_in_widget_constructors

import 'package:capstone_project/components/rounded_button.dart';
import 'package:capstone_project/screens/Login_Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/backgroundForLanding.dart';
import 'package:capstone_project/constants';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPictureForLogo(size),
            LoginButton(context),
            SignupButton(context),
          ],
        ),
      ),
    );
  }

  SvgPicture SvgPictureForLogo(Size size) {
    return SvgPicture.asset(
      "assets/icons/chat.svg",
      height: size.height * 0.45,
    );
  }

  RoundedButton SignupButton(BuildContext context) {
    return RoundedButton(
      text: "Sign Up",
      onPress: () {},
      color: kPrimaryLightColor,
      textColor: Colors.black,
    );
  }

  RoundedButton LoginButton(BuildContext context) {
    return RoundedButton(
      text: "Login",
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      },
      color: kPrimaryLightColor,
      textColor: Colors.black,
    );
  }
}
