// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:capstone_project/model/vaccination_type.dart';

class SignupLogic {
  signUp(
    controllerName,
    controllerEmail,
    controllerPassword,
    _auth,
    database,
    VaccinationType,
    controllerVaccinationCount,
  ) async {
    try {
      String name = controllerName.text;
      String email = controllerEmail.text;
      String password = controllerPassword.text;
      String vaccinationType = VaccinationType.toString().split('.').last;

      int vaccinationCount;
      if (vaccinationType ==
          VaccinationTypeEnum.NotVaccinated.toShortString()) {
        vaccinationCount = 0;
      } else {
        vaccinationCount = int.parse(controllerVaccinationCount.text);
      }

      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("1st step completed");

      final user = <String, dynamic>{
        "name": name,
        "email": email,
        "vaccination type": vaccinationType,
        "vaccination count": vaccinationCount,
      };

      // Add a new document with a generated ID
      await database.collection("users").doc(email).set(user);
      print("2nd step completed");
    } catch (e) {
      print(e);
    }
  }
}
