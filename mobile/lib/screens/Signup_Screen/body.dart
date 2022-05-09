import 'package:capstone_project/Constants.dart';
import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/circularButton.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:capstone_project/screens/Welcome_Screen/welcome_screen.dart';
import 'package:flutter/material.dart';

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
            _upperButtonContainer(context),
            _signupImage(size),
            const SizedBox(
              height: 22,
            ),
            _inputFieldForEmail(textControllerEmail),
            _inputFieldForPassword(textControllerPassword),
            _signupButton(textControllerEmail, textControllerPassword, context),
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
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 70),
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

RoundedButton _signupButton(TextEditingController controllerEmail,
    TextEditingController controllerPassword, BuildContext context) {
  String _txtForButton = "SIGNUP";
  return RoundedButton(
    text: _txtForButton,
    borderRadius: 16,
    textStyle: kHeadingTextStyle,
    color: const Color.fromRGBO(255, 113, 143, 1),
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
