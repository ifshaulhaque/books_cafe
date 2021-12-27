import 'package:books_cafe/Ui/Login/RegistrationActivity.dart';
import 'package:books_cafe/Ui/Student/StudentMainActivity.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginActivity extends StatelessWidget {
  var mainActivity;

  var emailField = TextFieldWithOutlinedBorder(
    "Email ID",
    Icon(Icons.email_outlined),
  );

  var passwordField = TextFieldWithOutlinedBorder(
    "Password",
    Icon(Icons.password_outlined),
  );

  FirebaseAuth mAuth = FirebaseAuth.instance;

  User? mUser = FirebaseAuth.instance.currentUser;

  LoginActivity(this.mainActivity);

  @override
  Widget build(BuildContext context) {

    if (mUser != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainActivity));
    }

    return Scaffold(
      body: Column(
        children: [
          BackgroundClipperWithText("Login"),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  emailField,
                  passwordField,
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.fromLTRB(0, 3, 10, 3),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String email = emailField.textController.text.toString();
                      String password =
                      passwordField.textController.text.toString();
                      try {
                        UserCredential userCredential = await mAuth
                            .signInWithEmailAndPassword(
                          email: email.trim(),
                          password: password.trim(),
                        );

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    mainActivity));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("No user found for that email")));
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Wrong Password")));
                        }
                      }
                    },
                    child: Text("Login"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegistrationActivity(mainActivity)),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
