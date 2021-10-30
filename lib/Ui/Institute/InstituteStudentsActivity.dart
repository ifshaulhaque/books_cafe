import 'package:flutter/material.dart';

class InstituteStudentsActivity extends StatelessWidget {
  const InstituteStudentsActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }

}