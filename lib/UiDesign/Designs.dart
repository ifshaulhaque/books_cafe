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
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0)
              )
          ),
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

  ElevatedButtonNormal(this.btnText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          btnText
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
      ),
    );
  }

}