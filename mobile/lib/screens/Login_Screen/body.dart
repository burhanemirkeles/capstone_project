// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/screens/Home_Page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/components/assets.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();

  @override
  void dispose() {
    textControllerEmail.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

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
            _inputFieldForEmail(textControllerEmail),
            _inputFieldForPassword(textControllerPassword),
            _loginButton(textControllerEmail, textControllerPassword, context),
          ],
        ),
      ),
    );
  }
}

SvgPicture _svgPictureForLogo(Size size) {
  String _svgName = IconAssets().login;
  return SvgPicture.asset(
    _svgName,
    height: size.height * 0.35,
  );
}

RoundedInputField _inputFieldForEmail(TextEditingController controller) {
  String _hintText = "Your Email";
  return RoundedInputField(
    isObscure: false,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
  );
}

RoundedInputField _inputFieldForPassword(TextEditingController controller) {
  String _hintText = "Your Password";
  return RoundedInputField(
    isObscure: true,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
  );
}

RoundedButton _loginButton(TextEditingController controllerEmail,
    TextEditingController controllerPassword, BuildContext context) {
  String _txtForButton = "LOGIN";
  return RoundedButton(
      text: _txtForButton,
      onPress: () {
        //NOT USE PUSH ROUTE TO HOME PAGE !!!
        //this logic is for only test
        //main logic will be like:
        /*onPress:(){
          _sendEmailAndPasswordTextToServer() ? route to Home Page : _displayErrorMessage()
          
        }
        */
        if ((controllerEmail.text == "ABCD") &&
            (controllerPassword.text == "1234")) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        }
      });
}
