import 'package:capstone_project/screens/Main_Screen/main_screen.dart';
import 'package:flutter/material.dart';

class LoginLogic {
  loginLogic(controllerEmail, controllerPassword, context, _auth) async {
    String email = controllerEmail.text;
    String password = controllerPassword.text;
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainScreen();
        }));
      }
    } catch (e) {
      print(e);
    }
  }
}
