// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/components/assets.dart';

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
            _svgPictureForLogo(size),
            SizedBox(height: size.height * 0.03),
            _inputFieldForEmail(),
            _inputFieldForPassword(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  SvgPicture _svgPictureForLogo(Size size) {
    String _svgName = IconAssets().login;
    return SvgPicture.asset(
      _svgName,
      height: size.height * 0.35,
    );
  }

  RoundedInputField _inputFieldForEmail() {
    String _hintText = "Your Email";
    return RoundedInputField(
        isObscure: false, hintText: _hintText, onChanged: (value) {});
  }

  RoundedInputField _inputFieldForPassword() {
    String _hintText = "Your Password";
    return RoundedInputField(
        isObscure: true, hintText: _hintText, onChanged: (value) {});
  }

  RoundedButton _loginButton() {
    String _txtForButton = "LOGIN";
    return RoundedButton(
      text: _txtForButton,
      onPress: () {
        // ignore: todo
        //TODO 1: take text strings from email & password fields
        // ignore: todo
        //TODO 2: send the relevant data to service
        // ignore: todo
        //TODO 3: take to verification isVerified == true ? page->Nextpage : give error message to user
      },
    );
  }
}
