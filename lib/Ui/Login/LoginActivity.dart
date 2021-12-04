import 'package:books_cafe/Ui/Login/RegistrationActivity.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class LoginActivity extends StatelessWidget {

  var mainActivity;

  LoginActivity(this.mainActivity);

  @override
  Widget build(BuildContext context) {
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
                  TextFieldWithOutlinedBorder(
                    "Email ID",
                    Icon(Icons.email_outlined),
                  ),
                  TextFieldWithOutlinedBorder(
                    "Password",
                    Icon(Icons.password_outlined),
                  ),
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
                  ElevatedButtonToActivity("Login",mainActivity),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationActivity(mainActivity)),
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