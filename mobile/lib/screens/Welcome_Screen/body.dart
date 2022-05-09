// ignore_for_file: non_constant_identifier_names, duplicate_ignore, use_key_in_widget_constructors

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/screens/Login_Screen/login_screen.dart';
import 'package:capstone_project/screens/Signup_Screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            _loginImage(size),
            _appName(),
            const SizedBox(
              height: 22,
            ),
            _loginButton(context),
            _signUpButton(context),
          ],
        ),
      ),
    );
  }

  Image _loginImage(Size size) {
    String _imageName = ImageAssets().login;
    return Image.asset(
      _imageName,
      //height: size.height * 0.35,
      width: size.width,
    );
  }

  Padding _appName() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        "Covid19 Vaccine Tracking & Information",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }

  RoundedButton _loginButton(BuildContext context) {
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
      textStyle: kHeadingTextStyle,
      color: const Color.fromRGBO(255, 113, 143, 1),
      borderRadius: 16,
    );
  }
}

RoundedButton _signUpButton(BuildContext context) {
  return RoundedButton(
    text: "Sign Up",
    onPress: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        ),
      );
    },
    textStyle: kHeadingTextStyle,
    color: const Color.fromRGBO(255, 113, 143, 1),
    borderRadius: 16,
  );
}
