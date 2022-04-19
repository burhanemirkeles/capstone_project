import 'package:capstone_project/components/assets.dart';
import 'package:capstone_project/components/backgroundForLanding.dart';
import 'package:capstone_project/components/roundedButton.dart';
import 'package:capstone_project/components/roundedInputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            _svgPictureForLogo(size),
            SizedBox(
              height: size.height * 0.03,
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

SvgPicture _svgPictureForLogo(Size size) {
  String _svgName = IconAssets().signup;
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

RoundedButton _signupButton(TextEditingController controllerEmail,
    TextEditingController controllerPassword, BuildContext context) {
  String _txtForButton = "SIGNUP";
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
