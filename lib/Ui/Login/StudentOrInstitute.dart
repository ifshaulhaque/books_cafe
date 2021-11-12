import 'package:books_cafe/Ui/Institute/InstituteMainActivity.dart';
import 'package:books_cafe/Ui/Student/StudentMainActivity.dart';
import 'package:flutter/material.dart';

class StudentOrInstitute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.tealAccent,
                  width: 3,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0)
                )
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => StudentMainActivity()),
                  );
                },
                child: Icon(
                  Icons.group,
                  size: 75,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.tealAccent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)
                  )
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => InstituteMainActivity()),
                  );
                },
                child: Icon(
                  Icons.apartment,
                  size: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}