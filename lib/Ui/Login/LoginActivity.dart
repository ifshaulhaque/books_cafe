import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class LoginActivity extends StatelessWidget {
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
              color: Colors.blueGrey[700],
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 10,
                  ),
                ),
              ),
            ),
          ),
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
                  ElevatedButtonNormal("Login"),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue,
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
