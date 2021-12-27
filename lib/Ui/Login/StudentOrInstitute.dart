import 'package:books_cafe/Constants.dart';
import 'package:books_cafe/Ui/Institute/InstituteMainActivity.dart';
import 'package:books_cafe/Ui/Login/LoginActivity.dart';
import 'package:books_cafe/Ui/Student/StudentMainActivity.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentOrInstitute extends StatelessWidget {
  User? mUser = FirebaseAuth.instance.currentUser;

  FirebaseDatabase mDatabase = FirebaseDatabase.instance;
  FirebaseFirestore mFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CheckLoginStatus(mUser, mFirestore, context);

    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.lightBlue[900],
              child: Image.asset(
                'assets/library.jpg',
                fit: BoxFit.fill,
                width: 75,
                height: 75,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    child: ImageTextCard('assets/student.png', "Student"),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              LoginActivity(StudentMainActivity()))
                      );
                    }
                ),
                GestureDetector(
                    child: ImageTextCard('assets/university.png', "Institute"),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              LoginActivity(InstituteMainActivity()))
                      );
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void CheckLoginStatus(User? mUser, FirebaseFirestore mFirestore, BuildContext buildContext) {
  var mContext = buildContext;

  if (mUser != null) {
    mFirestore.collection(USER_DATA_REF)
        .doc(mUser.email.toString())
        .get()
        .then((snapshot) {
          if(snapshot.data()!['type'] == STUDENT_TYPE) {
            Navigator.pushReplacement(mContext, MaterialPageRoute(builder: (context) => StudentMainActivity()));
          } else {
            Navigator.pushReplacement(mContext, MaterialPageRoute(builder: (context) => InstituteMainActivity()));
          }
    });
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 25);
    path.quadraticBezierTo(size.width * 0.25, size.height - 50,
        size.width * 0.5, size.height - 25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height, size.width, size.height - 25);
    path.lineTo(size.width, size.height - 25);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
