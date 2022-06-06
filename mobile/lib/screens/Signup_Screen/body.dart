// ignore_for_file: avoid_print

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/screens/Welcome_Screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerName = TextEditingController();
  final _auth = FirebaseAuth.instance;

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref("users/");

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
            _signupImage(size),
            _inputFieldForName(textControllerName),
            _inputFieldForEmail(textControllerEmail),
            _inputFieldForPassword(textControllerPassword),
            _signupButton(
              textControllerName,
              textControllerEmail,
              textControllerPassword,
              context,
              _auth,
              database,
              databaseRef,
            ),
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
          return const WelcomeScreen();
        }));
      },
    ),
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
  );
}

Image _signupImage(Size size) {
  String _imageName = ImageAssets().login;
  return Image.asset(
    _imageName,
    //height: size.height * 0.35,
    width: size.width,
  );
}

RoundedInputField _inputFieldForName(TextEditingController controller) {
  String _hintText = "Name Surname";
  return RoundedInputField(
    isObscure: false,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
    icon: Icons.email,
  );
}

RoundedInputField _inputFieldForEmail(TextEditingController controller) {
  String _hintText = "Your Email";
  return RoundedInputField(
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
    isObscure: true,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
    icon: Icons.lock,
  );
}

RoundedButton _signupButton(
  TextEditingController controllerName,
  TextEditingController controllerEmail,
  TextEditingController controllerPassword,
  BuildContext context,
  FirebaseAuth _auth,
  FirebaseDatabase db,
  DatabaseReference databaseReference,
) {
  String _txtForButton = "SIGN UP";
  return RoundedButton(
    text: _txtForButton,
    borderRadius: 16,
    textStyle: kHeadingTextStyle,
    color: const Color.fromRGBO(255, 113, 143, 1),
    onPress: () async {
      try {
        String name = controllerName.text;
        String email = controllerEmail.text;
        String password = controllerPassword.text;

        final newUser = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("1st step completed");
        await databaseReference.set({
          "name": name,
          "mail": email,
        });
        print("2nd step completed");
      } catch (e) {
        print(e);
      }
    },
  );
}
