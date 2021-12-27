import 'package:books_cafe/Ui/Student/StudentMainActivity.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class RegistrationActivity extends StatefulWidget {
  var mainActivity;

  RegistrationActivity(this.mainActivity);

  @override
  State<RegistrationActivity> createState() => _RegistrationActivityState(mainActivity);
}

class _RegistrationActivityState extends State<RegistrationActivity> {
  var mainActivity;


  _RegistrationActivityState(this.mainActivity);

  var nameField = TextFieldWithOutlinedBorder("Name", Icon(Icons.person));

  var emailField =
      TextFieldWithOutlinedBorder("Email ID", Icon(Icons.email_outlined));

  var mobileField = TextFieldWithOutlinedBorder(
      "Mobile No", Icon(Icons.phone_android_outlined));

  var passwordField =
      TextFieldWithOutlinedBorder("Password", Icon(Icons.password_outlined));

  FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseDatabase mDatabase = FirebaseDatabase.instance;
  FirebaseFirestore mFirestore = FirebaseFirestore.instance;

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
                  nameField,
                  emailField,
                  mobileField,
                  passwordField,
                  ElevatedButton(
                    onPressed: () async{
                      try {
                        String email = emailField.textController.text.toString();
                        String password = passwordField.textController.text.toString();
                        String mobileNo = mobileField.textController.text.toString();
                        String name = nameField.textController.text.toString();
                        String type;
                        if (mainActivity.runtimeType == StudentMainActivity) {
                          type = STUDENT_TYPE;
                        } else {
                          type = INSTITUTE_TYPE;
                        }
                        UserCredential userCredential = await mAuth.createUserWithEmailAndPassword(
                            email: email.trim(),
                            password: password.trim(),
                        );

                        if (userCredential != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saving Details")));
                          mFirestore.collection(USER_DATA_REF)
                              .doc(email.trim())
                              .set({
                                "name" : name.trim(),
                                "emailId" : email.trim(),
                                "mobileNo" : mobileNo.trim(),
                                "type" : type.trim(),
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account created successfully")));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainActivity));
                        }

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Register"),
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
