// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, nullable_type_in_catch_clause, import_of_legacy_library_into_null_safe, unnecessary_null_comparison, avoid_print, unused_import

import 'package:capstone_project/components/alertDialogPopup.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/components/roundedButton.dart';

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/screens/Login_Screen/login_logic.dart';
import 'package:capstone_project/screens/Main_Screen/main_screen.dart';
import 'package:capstone_project/screens/Welcome_Screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final _auth = FirebaseAuth.instance;

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
            _upperButtonContainer(context),
            SizedBox(height: size.height * 0.001),
            _loginImage(size),
            SizedBox(height: size.height * 0.03),
            _inputFieldForEmail(textControllerEmail),
            _inputFieldForPassword(textControllerPassword),
            _loginButton(
                textControllerEmail, textControllerPassword, context, _auth),
          ],
        ),
      ),
    );
  }
}

Container _upperButtonContainer(BuildContext context) {
  return Container(
    child: CircularButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WelcomeScreen();
        }));
      },
    ),
    alignment: Alignment.topLeft,
    padding: EdgeInsets.fromLTRB(20, 0, 0, 70),
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

RoundedInputField _inputFieldForEmail(TextEditingController controller) {
  String _hintText = "Your Email";
  return RoundedInputField(
    inputType: TextInputType.emailAddress,
    isObscure: false,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
    icon: Icons.email,
  );
}

RoundedInputField _inputFieldForPassword(TextEditingController controller) {
  String _hintText = "Your Password";
  return RoundedInputField(
    inputType: TextInputType.text,
    isObscure: true,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
    icon: Icons.lock,
  );
}

RoundedButton _loginButton(
    TextEditingController controllerEmail,
    TextEditingController controllerPassword,
    BuildContext context,
    FirebaseAuth _auth) {
  String _txtForButton = "Login";
  return RoundedButton(
    text: _txtForButton,
    onPress: () async => await LoginLogic()
        .loginLogic(controllerEmail, controllerPassword, context, _auth),
    textStyle: kHeadingTextStyle,
    color: Color.fromRGBO(255, 113, 143, 1),
  );
}
