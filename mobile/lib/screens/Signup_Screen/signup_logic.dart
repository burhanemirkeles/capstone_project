// ignore_for_file: avoid_print

class SignupLogic {
  signUp(controllerName, controllerEmail, controllerPassword, _auth,
      database) async {
    try {
      String name = controllerName.text;
      String email = controllerEmail.text;
      String password = controllerPassword.text;

      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("1st step completed");
      final user = <String, dynamic>{
        "name": name,
        "email": email,
        "born": 1815
      };

      // Add a new document with a generated ID
      await database.collection("users").doc(name).set(user);
      print("2nd step completed");
    } catch (e) {
      print(e);
    }
  }
}
