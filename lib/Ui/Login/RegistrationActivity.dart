import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class RegistrationActivity extends StatelessWidget {

  var mainActivity;

  RegistrationActivity(this.mainActivity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackgroundClipperWithText("Registration"),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFieldWithOutlinedBorder("Name", Icon(Icons.person)),
                  TextFieldWithOutlinedBorder(
                      "Email ID", Icon(Icons.email_outlined)),
                  TextFieldWithOutlinedBorder(
                      "Mobile No", Icon(Icons.phone_android_outlined)),
                  TextFieldWithOutlinedBorder(
                      "Password", Icon(Icons.password_outlined)),
                  ElevatedButtonNormal("Register",mainActivity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
