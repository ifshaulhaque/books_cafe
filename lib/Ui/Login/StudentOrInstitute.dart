import 'package:books_cafe/Ui/Institute/InstituteMainActivity.dart';
import 'package:books_cafe/Ui/Login/LoginActivity.dart';
import 'package:books_cafe/Ui/Student/StudentMainActivity.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentOrInstitute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => LoginActivity(StudentMainActivity()))
                    );
                  }
                ),
                GestureDetector(
                  child: ImageTextCard('assets/university.png', "Institute"),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginActivity(InstituteMainActivity()))
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
