// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/components/textFieldContainer.dart';
import 'package:capstone_project/model/vaccination_type.dart';

import 'package:capstone_project/screens/Signup_Screen/signup_logic.dart';
import 'package:capstone_project/screens/Welcome_Screen/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  //FirebaseDatabase database = FirebaseDatabase.instance;
  var database = FirebaseFirestore.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref("users/");

  VaccinationType vaccinationType = VaccinationType.A;

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
            // _upperButtonContainer(context),
            //_signupImage(size),
            _inputFieldForName(textControllerName),
            _inputFieldForEmail(textControllerEmail),
            TextFieldContainer(
              child: Column(
                children: [
                  _textAreaOfVaccinationQuestion(),
                  ListTile(
                    title: Text(VaccinationType.Sinovac.toShortString()),
                    leading: Radio<VaccinationType>(
                      value: VaccinationType.Sinovac,
                      groupValue: vaccinationType,
                      onChanged: (VaccinationType? value) {
                        setState(
                          () {
                            vaccinationType = value!;
                          },
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(VaccinationType.Biontech.toShortString()),
                    leading: Radio<VaccinationType>(
                        value: VaccinationType.Biontech,
                        groupValue: vaccinationType,
                        onChanged: (VaccinationType? value) {
                          setState(() {
                            vaccinationType = value!;
                          });
                        }),
                  ),
                ],
              ),
            ),
            _howManyTimesVaccinated(),
            _inputFieldForPassword(textControllerPassword),
            _signupButton(
              textControllerName,
              textControllerEmail,
              textControllerPassword,
              context,
              _auth,
              databaseRef,
              database,
              vaccinationType,
            ),
          ],
        ),
      ),
    );
  }

  Row _textAreaOfVaccinationQuestion() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.vaccines,
          color: Color(0xFF6F35A5),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Which vaccine did you get?",
          style: GoogleFonts.poppins(
            fontSize: 16,
            letterSpacing: 0.2,
          ),
        ),
      ],
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
    height: size.height * 0.3,
    width: size.width,
  );
}

RoundedInputField _inputFieldForName(TextEditingController controller) {
  String _hintText = "Name Surname";
  return RoundedInputField(
    inputType: TextInputType.text,
    isObscure: false,
    hintText: _hintText,
    onChanged: (value) {},
    controller: controller,
    icon: Icons.perm_identity_outlined,
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

RoundedInputField _howManyTimesVaccinated() {
  return RoundedInputField(
    inputType: TextInputType.number,
    hintText: "How many times vaccinated",
    onChanged: (value) {},
    isObscure: false,
    icon: Icons.query_stats,
  );
}

RoundedInputField _inputFieldForPassword(TextEditingController controller) {
  String _hintText = "Create Your Password";
  return RoundedInputField(
    inputType: TextInputType.text,
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
  DatabaseReference databaseReference,
  FirebaseFirestore database,
  VaccinationType vaccinationType,
) {
  String _txtForButton = "SIGN UP";
  return RoundedButton(
    text: _txtForButton,
    borderRadius: 16,
    textStyle: kHeadingTextStyle,
    color: const Color.fromRGBO(255, 113, 143, 1),
    onPress: () async => await SignupLogic().signUp(controllerName,
        controllerEmail, controllerPassword, _auth, database, vaccinationType),
  );
}
