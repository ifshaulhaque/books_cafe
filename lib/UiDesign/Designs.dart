import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageTextCard extends StatelessWidget {
  var image;
  var title;

  ImageTextCard(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(
            10,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey.shade900,
                width: 3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Image.asset(
            image,
            width: 100,
            height: 100,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class TextFieldWithOutlinedBorder extends StatelessWidget {
  var labelText;
  var suffixIcon;

  TextFieldWithOutlinedBorder(this.labelText, this.suffixIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class ElevatedButtonNormal extends StatelessWidget {
  var btnText;
  var activity;

  ElevatedButtonNormal(this.btnText, this.activity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => activity));
        },
        child: Text(btnText),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
      ),
    );
  }
}

class BackgroundClipperWithText extends StatelessWidget {
  var text;

  BackgroundClipperWithText(this.text);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.blueGrey[700],
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 10,
            ),
          ),
        ),
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
